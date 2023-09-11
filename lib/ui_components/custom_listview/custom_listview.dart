import 'dart:io';
import 'package:base_project/core/constant/point_size.dart';
import 'package:base_project/core/util/debouncer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomListView extends StatefulWidget {
  final Future<void> Function() onRefresh;
  final void Function() onScroll;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final bool hasMaxReached;
  final int debounceMilliSeconds;
  final Widget loadingIndicator;
  bool isRefreshRunning;

  CustomListView(
      {required this.onRefresh,
      required this.onScroll,
      required this.itemBuilder,
      required this.hasMaxReached,
      required this.itemCount,
      this.debounceMilliSeconds = 300,
      this.isRefreshRunning = false,
      this.loadingIndicator = const CircularProgressIndicator(),
      Key? key})
      : super(key: key);

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController?.addListener(_onScroll);
  }

  int _getItemCount() {
    if (widget.hasMaxReached) {
      return widget.itemCount;
    } else {
      return widget.itemCount + 1;
    }
  }

  bool get _isBottom {
    if (!(_scrollController?.hasClients ?? true)) return false;
    final maxScroll = _scrollController?.position.maxScrollExtent;
    final currentScroll = _scrollController?.position.pixels;

    return currentScroll == maxScroll;
  }

  void _onScroll() {
    if (_isBottom && !widget.hasMaxReached) {
      Debouncer(milliseconds: widget.debounceMilliSeconds).run(() {
        widget.onScroll();
      });
    }
  }

  Future<void> _onRefresh() async {
    if (!widget.isRefreshRunning) {
      widget.onRefresh();
      widget.isRefreshRunning = true;
      await Future.doWhile(() async {
        if (widget.isRefreshRunning) {
          await Future.delayed(Duration.zero);
          return true;
        }
        return false;
      });
    }
  }

  @override
  Widget build(BuildContext context) =>
      Platform.isAndroid ? _buildAndroidList() : _buildIOSList();

  //Widget functions
  Widget _buildAndroidList() => RefreshIndicator(
        onRefresh: _onRefresh,
        child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            slivers: [
              _buildSliverList(),
            ]),
      );

  Widget _buildIOSList() => CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: _onRefresh,
          ),
          _buildSliverList(),
        ],
      );

  Widget _buildSliverList() => SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => index >= widget.itemCount
              ? _getLoadingIndicator()
              : widget.itemBuilder(context, index),
          childCount: _getItemCount()));

  Widget _getLoadingIndicator() => Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: PointSize.value12),
          child: widget.loadingIndicator,
        ),
      );
}
