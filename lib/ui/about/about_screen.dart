import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0B21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0B21),
        title: const Text(
          "About Us",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "OtakuStream",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Your ultimate destination for watching anime online. We provide high-quality streams and the latest anime updates.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.5,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 32),
            const Text(
              "Follow Us",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white70,
                letterSpacing: 0.4,
              ),
            ),
            const SizedBox(height: 18),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Color(0xFF00E5FF),
                    size: 28,
                  ),
                  onPressed:
                      () => _launchURL("https://instagram.com/otakustream"),
                ),
                const SizedBox(width: 24),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.redditAlien,
                    color: Color(0xFF00E5FF),
                    size: 28,
                  ),
                  onPressed:
                      () => _launchURL("https://reddit.com/r/otakustream"),
                ),
                const SizedBox(width: 24),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.discord,
                    color: Color(0xFF00E5FF),
                    size: 28,
                  ),
                  onPressed: () => _launchURL("https://discord.gg/otakustream"),
                ),
              ],
            ),

            const Spacer(),
            const Text(
              "© 2025 OtakuStream. All rights reserved.",
              style: TextStyle(fontSize: 12, color: Colors.white54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
