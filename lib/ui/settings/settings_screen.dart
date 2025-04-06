import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.put(SettingsController());

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed:
                controller.logout, // Call logout function from controller
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(color: Colors.white24, height: 1.5),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),
          const Text(
            "About Us",
            style: TextStyle(fontSize: 18, color: Colors.white60),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          const Text(
            "Our Social",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  size: 36,
                  color: Colors.white,
                ), // Instagram
                onPressed: controller.openInstagram,
              ),
              const SizedBox(width: 30),
              IconButton(
                icon: const Icon(
                  Icons.reddit,
                  size: 36,
                  color: Colors.white,
                ), // Reddit
                onPressed: controller.openReddit,
              ),
              const SizedBox(width: 30),
              IconButton(
                icon: const Icon(
                  Icons.discord,
                  size: 36,
                  color: Colors.white,
                ), // Discord
                onPressed: controller.openDiscord,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
