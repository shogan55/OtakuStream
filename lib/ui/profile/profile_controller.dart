import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../routes/app_routes.dart';

class ProfileController extends GetxController {
  var isLoading = true.obs;
  var userData = Rxn<Map<String, dynamic>>();
  var watchlistCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
    fetchWatchlistCount();
  }

  /// 🔍 Get user info from Firestore
  Future<void> fetchUserData() async {
    try {
      isLoading(true);
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        final doc =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        userData.value = doc.data();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load user data");
    } finally {
      isLoading(false);
    }
  }

  /// 🔢 Count total anime in user's watchlist
  Future<void> fetchWatchlistCount() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        final snapshot =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(uid)
                .collection('watchlist')
                .get();

        watchlistCount.value = snapshot.docs.length;
      }
    } catch (e) {
      Get.snackbar("Error", "Unable to fetch watchlist count");
      watchlistCount.value = 0;
    }
  }

  /// 🚪 Log out the user and navigate
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(AppRoutes.login);
  }
}
