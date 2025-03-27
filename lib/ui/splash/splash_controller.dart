import 'package:get/get.dart';
import 'package:otakustream/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(Duration(seconds: 3)); // Wait for 3 sec

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.offNamed(AppRoutes.home); // Navigate to Home if logged in
    } else {
      Get.offNamed(AppRoutes.login); // Navigate to Login if not logged in
    }
  }
}
