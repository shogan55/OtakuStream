import 'package:get/get.dart';
import '../../models/api/anime_model.dart';
import '../../services/api_service.dart';

class HomeController extends GetxController {
  var trendingAnime = <Anime>[].obs;
  var topAiring = <Anime>[].obs;
  var topRanked = <Anime>[].obs;
  var topPopular = <Anime>[].obs;
  var currentCarouselIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTrendingAnime();
    fetchTopAiring();
    fetchTopRanked();
    fetchTopPopular();
  }

  void fetchTrendingAnime() async {
    try {
      var result = await ApiService.fetchTrendingAnime();
      print("📡 Trending Anime Response: $result"); // ✅ Debugging API Data
      if (result.isNotEmpty) {
        trendingAnime.assignAll(result);
      } else {
        print("⚠️ No Trending Anime Found!");
      }
    } catch (e) {
      print("❌ Error loading trending anime: $e");
    }
  }

  void fetchTopAiring() async {
    try {
      var result = await ApiService.fetchTopAiring();
      topAiring.assignAll(result);
    } catch (e) {
      print("❌ Error loading top airing anime: $e");
    }
  }

  void fetchTopRanked() async {
    try {
      var result = await ApiService.fetchTopRanked();
      topRanked.assignAll(result);
    } catch (e) {
      print("❌ Error loading top ranked anime: $e");
    }
  }

  void fetchTopPopular() async {
    try {
      var result = await ApiService.fetchTopPopular();
      topPopular.assignAll(result);
    } catch (e) {
      print("❌ Error loading top popular anime: $e");
    }
  }

  // ✅ Missing Function Added
  void updateCarouselIndex(int index) {
    currentCarouselIndex.value = index;
  }
}
