import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/api/anime_model.dart';
import '../../ui/widgets/anime_card.dart';
import 'genre_anime_controller.dart';

class GenreAnimeScreen extends StatelessWidget {
  final String genre;

  const GenreAnimeScreen({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GenreAnimeController(genre));

    return Scaffold(
      appBar: AppBar(
        title: Text("$genre Anime"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.animeList.isEmpty) {
          return const Center(
            child: Text(
              "No anime found",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.65,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: controller.animeList.length,
          itemBuilder: (context, index) {
            final Anime anime = controller.animeList[index];
            return AnimeCard(anime: anime);
          },
        );
      }),
    );
  }
}
