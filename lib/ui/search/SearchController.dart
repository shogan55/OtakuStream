import 'package:get/get.dart';
import 'package:otakustream/services/api_service.dart';
import 'package:otakustream/models/api/anime_model.dart';
import 'dart:async';

class SearchController extends GetxController {
  var searchQuery = ''.obs;
  var searchResults = <Anime>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  Timer? _debounce;

  void onSearchChanged(String query) {
    searchQuery.value = query;

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        fetchSearchResults(query);
      } else {
        searchResults.clear();
      }
    });
  }

  Future<void> fetchSearchResults(String query) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      List<Anime> results = await ApiService.searchAnime(query);
      searchResults.assignAll(results);
    } catch (e) {
      errorMessage.value = "Error fetching results";
    } finally {
      isLoading.value = false;
    }
  }
}
