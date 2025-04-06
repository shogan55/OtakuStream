import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutController extends GetxController {
  // ✅ Open Instagram
  void openInstagram() async {
    Uri url = Uri.parse(
      'https://instagram.com/otakustream',
    ); // Replace with actual link
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Could not open Instagram");
    }
  }

  // ✅ Open Reddit
  void openReddit() async {
    Uri url = Uri.parse(
      'https://reddit.com/r/otakustream',
    ); // Replace with actual link
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Could not open Reddit");
    }
  }

  // ✅ Open Discord
  void openDiscord() async {
    Uri url = Uri.parse(
      'https://discord.gg/otakustream',
    ); // Replace with actual link
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Could not open Discord");
    }
  }
}
