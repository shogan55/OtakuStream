import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_color.dart';
import '../about/about_controller.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AboutController controller = Get.put(AboutController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text("About Us"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/logo.png'), // App Logo
            ),
            const SizedBox(height: 15),
            const Text(
              "OtakuStream",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Your ultimate destination for watching anime online. "
              "We provide high-quality streams and the latest anime updates.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white60),
            ),
            const SizedBox(height: 30),

            // 🔹 Social Media Links
            const Text(
              "Follow Us",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(
                  Icons.camera_alt,
                  "Instagram",
                  controller.openInstagram,
                ),
                const SizedBox(width: 20),
                _buildSocialButton(
                  Icons.reddit,
                  "Reddit",
                  controller.openReddit,
                ),
                const SizedBox(width: 20),
                _buildSocialButton(
                  Icons.discord,
                  "Discord",
                  controller.openDiscord,
                ),
              ],
            ),

            const Spacer(),

            // 🔹 Footer
            const Text(
              "© 2025 OtakuStream. All rights reserved.",
              style: TextStyle(fontSize: 14, color: Colors.white60),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    IconData icon,
    String label,
    VoidCallback onPressed,
  ) {
    return IconButton(
      icon: Icon(icon, size: 40, color: AppColors.secondary),
      tooltip: label,
      onPressed: onPressed,
    );
  }
}
