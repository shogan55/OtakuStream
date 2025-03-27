import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/api/anime_model.dart';
import '../../services/firebase_service.dart';

class WatchlistController extends GetxController {
  var watchlist = <Anime>[].obs; // ✅ Stores watchlist anime

  @override
  void onInit() {
    super.onInit();
    fetchWatchlist();
  }

  /// ✅ Fetch Watchlist from Firebase
  void fetchWatchlist() async {
    try {
      var userId = FirebaseService.getUserId();
      if (userId == null) return;

      var snapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('watchlist')
              .get();

      var animeList =
          snapshot.docs.map((doc) => Anime.fromJson(doc.data())).toList();

      watchlist.assignAll(animeList);
    } catch (e) {
      print('Error fetching watchlist: $e');
    }
  }

  /// ✅ Add Anime to Watchlist
  Future<void> addToWatchlist(Anime anime) async {
    try {
      var userId = FirebaseService.getUserId();
      if (userId == null) return;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('watchlist')
          .doc(anime.id.toString())
          .set(anime.toJson());

      watchlist.add(anime);
      Get.snackbar(
        "Success",
        "${anime.title} added to Watchlist!",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print('Error adding to watchlist: $e');
    }
  }

  /// ✅ Remove Anime from Watchlist
  Future<void> removeFromWatchlist(Anime anime) async {
    try {
      var userId = FirebaseService.getUserId();
      if (userId == null) return;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('watchlist')
          .doc(anime.id.toString())
          .delete();

      watchlist.removeWhere((a) => a.id == anime.id);
      Get.snackbar(
        "Removed",
        "${anime.title} removed from Watchlist!",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print('Error removing from watchlist: $e');
    }
  }

  /// ✅ Check if Anime is in Watchlist
  bool isInWatchlist(Anime anime) {
    return watchlist.any((a) => a.id == anime.id);
  }
}
