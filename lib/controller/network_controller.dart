import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetWorkController extends GetxController {
  static const int noConnection = 0;
  static const int wifi = 1;
  static const int mobile = 2;
  var connectionStatus = 0.obs;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  Future<void> initConnectivity() async {
    try {
      final List<ConnectivityResult> result = await _connectivity
          .checkConnectivity();

      _updateConnectionStatus(result);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.wifi)) {
      connectionStatus.value = wifi;
    } else if (results.contains(ConnectivityResult.mobile)) {
      connectionStatus.value = mobile;
    } else if (results.contains(ConnectivityResult.none)) {
      connectionStatus.value = noConnection;
    } else {
      Get.snackbar("Network Error", "Failed to get network");
    }
  }

  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
