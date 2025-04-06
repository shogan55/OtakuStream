import 'package:flutter/material.dart' as flutter; // ✅ Prevent Conflict
import 'package:get/get.dart';
import '../../models/api/anime_model.dart';
import '../../services/api_service.dart';
import '../../utils/helpers.dart';
import '../../utils/app_color.dart';

// ✅ Renamed Class to Avoid Conflict
class SearchAnimeController extends GetxController {
  final flutter.TextEditingController searchController =
      flutter.TextEditingController();
  var searchResults = <Anime>[].obs;
  var isLoading = false.obs;

  void searchAnime(String query) async {
    if (query.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter a search term.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.background,
        colorText: AppColors.textColor,
      );

      return;
    }

    isLoading.value = true;

    try {
      var results = await ApiService.searchAnime(query);
      searchResults.assignAll(results);
    } catch (e) {
      showSnackbar("Error", "Failed to fetch results.");
    } finally {
      isLoading.value = false;
    }
  }
}
