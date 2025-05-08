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
            onPressed: controller.logout,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(color: Colors.white24, height: 1.5),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),

          // About Section
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.white70),
            title: const Text(
              "About Us",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.white54,
            ),
            onTap: () => Get.toNamed('/about'), // ✅ Navigate to About
          ),
          const Divider(color: Colors.white24),

          const SizedBox(height: 20),
          const Center(
            child: Text(
              "Our Social",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  size: 32,
                  color: Colors.white,
                ), // Instagram icon substitute
                onPressed: controller.openInstagram,
              ),
              const SizedBox(width: 30),
              IconButton(
                icon: const Icon(
                  Icons.reddit,
                  size: 32,
                  color: Colors.white,
                ), // Reddit icon substitute
                onPressed: controller.openReddit,
              ),
              const SizedBox(width: 30),
              IconButton(
                icon: const Icon(
                  Icons.discord,
                  size: 32,
                  color: Colors.white,
                ), // Discord icon substitute
                onPressed: controller.openDiscord,
              ),
            ],
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
