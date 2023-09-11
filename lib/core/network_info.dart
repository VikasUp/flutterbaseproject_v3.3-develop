import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'index.dart';

class NetworkInfo {
  bool isConnected = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  static final NetworkInfo _singleton = NetworkInfo._internal();

  factory NetworkInfo() => _singleton;

  NetworkInfo._internal() {
    _initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
      log.info(e.toString());
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        isConnected = true;
        break;
      case ConnectivityResult.none:
        isConnected = false;
        break;
      default:
        isConnected = false;
        break;
    }
  }

  void cancelSubscription() {
    _connectivitySubscription?.cancel();
  }
}
