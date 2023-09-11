import 'dart:async';
import 'package:flutter/foundation.dart';

class Debouncer {
  final int milliseconds;
  late VoidCallback action;
  Timer? _timer;

  Debouncer({
    this.milliseconds = 300,
  });

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(
      Duration(
        milliseconds: milliseconds,
      ),
      action,
    );
  }
}
