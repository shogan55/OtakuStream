import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../routes/app_routes.dart';
import '../../services/firebase_service.dart';

class AuthController extends GetxController {
  final Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    firebaseUser.bindStream(FirebaseAuth.instance.authStateChanges());
    super.onInit();
  }

  Future<void> login(String email, String password) async {
    final result = await FirebaseService.signIn(email, password);
    if (result != null) {
      print("✅ Login success");
      Get.offAllNamed(AppRoutes.home);
    }
  }

  Future<void> signup(String email, String password) async {
    final result = await FirebaseService.signUp(email, password);
    if (result != null) {
      print("✅ Signup success");
      Get.offAllNamed(AppRoutes.home);
    }
  }

  Future<void> logout() async {
    await FirebaseService.signOut();
    print("🔒 User logged out");
    Get.offAllNamed(AppRoutes.login);
  }
}
