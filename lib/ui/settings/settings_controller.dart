import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  void logout() {
    Get.dialog(
      AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Get.back(), // Close the dialog
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // Perform logout logic here
              Get.back(); // Close the dialog
              Get.offAllNamed('/login'); // Navigate to login screen
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  void openInstagram() {
    // Open Instagram profile logic (use url_launcher package)
  }

  void openReddit() {
    // Open Reddit community logic
  }

  void openDiscord() {
    // Open Discord server logic
  }
}
