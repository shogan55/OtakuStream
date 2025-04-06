import 'package:get/get.dart';
import '../../models/api/anime_model.dart';
import '../../models/api/episode_model.dart';
import '../../services/streaming_service.dart';
import '../player/player_screen.dart';

class DetailsController extends GetxController {
  late Anime anime;

  final episodes = <Episode>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final selectedSource = 'zoro'.obs;

  @override
  void onInit() {
    super.onInit();
    anime = Get.arguments as Anime;
    print("📦 Anime object received: $anime");
    print("🆔 Anime ID: ${anime.id}");

    fetchEpisodes();
  }

  void changeSource(String newSource) {
    selectedSource.value = newSource;
    fetchEpisodes();
  }

  void fetchEpisodes() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final fetchedEpisodes = await StreamingService.fetchEpisodes(
        anime,
        selectedSource.value,
      );
      episodes.assignAll(fetchedEpisodes);
    } catch (e) {
      errorMessage.value = e.toString();
      print("❌ Error fetching episodes: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void watchEpisode(String episodeId) {
    print("▶️ Launching Player with Episode ID: $episodeId");
    Get.to(() => const PlayerScreen(), arguments: episodeId);
  }
}
