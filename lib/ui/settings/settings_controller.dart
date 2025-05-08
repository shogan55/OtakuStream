import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  void logout() {
    Get.dialog(
      AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text("Cancel")),
          TextButton(
            onPressed: () {
              Get.back();
              Get.offAllNamed('/login'); // ✅ Go to login screen
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  void openInstagram() {
    Get.snackbar("Instagram", "Opening Instagram profile...");
    // Use url_launcher to open the link
  }

  void openReddit() {
    Get.snackbar("Reddit", "Opening Reddit community...");
    // Use url_launcher to open the link
  }

  void openDiscord() {
    Get.snackbar("Discord", "Opening Discord server...");
    // Use url_launcher to open the link
  }
}
