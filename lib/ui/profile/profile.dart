import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_controller.dart';
import '../../routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController controller = Get.put(ProfileController());
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/profile_bg.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black87, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 120),
                        CircleAvatar(
                          radius: 52,
                          backgroundColor: Colors.white10,
                          child: CircleAvatar(
                            radius: 48,
                            backgroundColor: Colors.blueAccent,
                            child: Text(
                              user?.email?[0].toUpperCase() ?? '?',
                              style: const TextStyle(
                                fontSize: 38,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          user?.email ?? "No Email",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(
                          () => Text(
                            "${controller.watchlistCount.value} Anime in Watchlist",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: _profileActions(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileActions(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildActionItem(
            icon: Icons.edit,
            label: "Edit Profile",
            onTap: () => _openEditProfileSheet(context),
          ),
          const Divider(color: Colors.white10, height: 1),
          _buildActionItem(
            icon: Icons.bookmark_added,
            label: "My Watchlist",
            subtitle: Obx(
              () => Text(
                "${controller.watchlistCount.value} items",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            onTap: () => Get.toNamed(AppRoutes.watchlist),
          ),
          const Divider(color: Colors.white10, height: 1),
          _buildActionItem(
            icon: Icons.logout,
            label: "Logout",
            iconColor: Colors.redAccent,
            textColor: Colors.redAccent,
            onTap: () {
              controller.logout();
              Get.snackbar(
                "Logged Out",
                "See you soon!",
                snackPosition: SnackPosition.BOTTOM,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String label,
    Color iconColor = Colors.white,
    Color textColor = Colors.white,
    Widget? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(label, style: TextStyle(color: textColor, fontSize: 16)),
      subtitle: subtitle,
      onTap: onTap,
    );
  }

  void _openEditProfileSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Edit Profile",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "New Name",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back();
                Get.snackbar("Saved", "Feature coming soon!");
              },
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
