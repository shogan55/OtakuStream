import 'package:get/get.dart';
import 'package:otakustream/utils/app_color.dart';
import '../../models/api/anime_model.dart';
import '../../services/api_service.dart';

class DetailsController extends GetxController {
  final Rx<Anime?> anime = Rx<Anime?>(null);

  @override
  void onInit() {
    super.onInit();
    final animeData = Get.arguments;
    if (animeData != null) {
      anime.value = Anime.fromJson(animeData);
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
