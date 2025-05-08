import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutController extends GetxController {
  // ✅ Open Instagram
  void openInstagram() async {
    Uri url = Uri.parse('https://instagram.com/otakustream');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Could not open Instagram");
    }
  }

  void openReddit() async {
    Uri url = Uri.parse('https://reddit.com/r/otakustream');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Could not open Reddit");
    }
  }

  void openDiscord() async {
    Uri url = Uri.parse('https://discord.gg/otakustream');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Could not open Discord");
    }
  }
}
