import 'package:get/get.dart';
import '../../models/api/anime_model.dart';
import '../../models/api/episode_model.dart';
import '../../services/streaming_service.dart';

class DetailsController extends GetxController {
  final Rx<Anime?> anime = Rx<Anime?>(null);
  final RxList<Episode> episodes = <Episode>[].obs;
  final RxInt selectedTab = 0.obs;
  final RxString selectedSource = 'Zoro'.obs;

  final List<String> availableSources = ['Zoro', 'AnimePahe', 'AnimeKai'];

  DetailsController(Anime animeArg) {
    anime.value = animeArg;
  }

  @override
  void onInit() {
    super.onInit();
    loadEpisodes();
  }

  void changeSource(String? newSource) {
    if (newSource != null && availableSources.contains(newSource)) {
      selectedSource.value = newSource;
      loadEpisodes();
    }
  }

  void selectTab(int index) => selectedTab.value = index;

  Future<void> loadEpisodes() async {
    if (anime.value == null) return;

    try {
      print("📡 Fetching episodes from ${selectedSource.value.toLowerCase()}");

      final fetched = await StreamingService.fetchEpisodes(
        anime.value!,
        selectedSource.value.toLowerCase(),
      );

      episodes.assignAll(fetched);
      print("✅ Episodes loaded: ${episodes.length}");
    } catch (e) {
      print("❌ Failed to load episodes: $e");
      episodes.clear();
    }
  }
}
