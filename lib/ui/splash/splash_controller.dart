import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      print("✅ Splash: Logged in as ${user.email}");
      Get.offAllNamed(AppRoutes.home);
    } else {
      print("❌ Splash: No user logged in");
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
