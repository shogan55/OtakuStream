import 'package:get/get.dart';
import 'package:otakustream/utils/app_color.dart';
import '../../models/api/anime_model.dart';
import '../../services/streaming_service.dart';

class DetailsController extends GetxController {
  final Rx<Anime?> anime = Rx<Anime?>(null);
  final StreamingService _streamingService = StreamingService();

  @override
  void onInit() {
    super.onInit();
    final animeData = Get.arguments;
    if (animeData != null) {
      anime.value = Anime.fromJson(animeData);
      fetchVideoUrl();
    }
  }

  // ✅ Fetch video URL separately
  void fetchVideoUrl() async {
    if (anime.value != null) {
      String streamUrl = await _streamingService.getEpisodeStreamUrl(
        anime.value!.id.toString(),
      );
      anime.value = Anime(
        id: anime.value!.id,
        title: anime.value!.title,
        image: anime.value!.image,
        score: anime.value!.score,
        genres: anime.value!.genres,
        videoUrl: streamUrl, // ✅ Update video URL
      );
    }
  }

  void watchAnime() {
    if (anime.value?.videoUrl.isNotEmpty ?? false) {
      Get.toNamed('/video', arguments: anime.value?.videoUrl);
    } else {
      Get.snackbar(
        "Error",
        "No video available",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.background,
        colorText: AppColors.textColor,
      );
    }
  }
}
