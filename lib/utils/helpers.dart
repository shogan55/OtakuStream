import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ✅ Show Snackbar (Already there)
void showSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.black87,
    colorText: Colors.white,
    duration: const Duration(seconds: 2),
  );
}

/// ✅ Proxy URL Builder (Add this now)
String buildProxyUrl(String provider, String originalUrl) {
  final encoded = Uri.encodeComponent(originalUrl);
  return 'https://anime_proxy.app/api/proxy?provider=$provider&target=$encoded';
}
