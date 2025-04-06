import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsController settingsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.dark_mode, color: Colors.orange),
            title: Text("Dark Mode"),
            trailing: Obx(
              () => Switch(
                value: settingsController.isDarkMode.value,
                onChanged: (value) {
                  settingsController.toggleDarkMode();
                },
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info, color: Colors.blue),
            title: Text("About App"),
            onTap: () {
              Get.toNamed('/about');
            },
          ),
        ],
      ),
    );
  }
}
