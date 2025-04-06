import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';
import '../search/search_controller.dart';
import '../widgets/anime_card.dart';
import '../../utils/app_color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchAnimeController controller = Get.put(SearchAnimeController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          "Search Anime",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: controller.searchController,
              onSubmitted: controller.searchAnime,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search anime...",
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }

              if (controller.searchResults.isEmpty) {
                return Center(
                  child: Text(
                    "No results found",
                    style: TextStyle(color: Colors.white54, fontSize: 18),
                  ),
                );
              }

              return ListView.builder(
                itemCount: controller.searchResults.length,
                itemBuilder: (context, index) {
                  return AnimeCard(anime: controller.searchResults[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
