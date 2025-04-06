import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../details/details_controller.dart'; // ✅ Make sure it's imported
import '../../models/api/anime_model.dart';
import '../../utils/app_color.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailsController controller = Get.put(DetailsController());

    return Obx(() {
      final anime = controller.anime;

      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(anime.title, style: const TextStyle(color: Colors.white)),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Anime Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    anime.image,
                    width: 250,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Title & Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      anime.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 22),
                      const SizedBox(width: 5),
                      Text(
                        anime.score.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Genres
              if (anime.genres.isNotEmpty)
                Wrap(
                  spacing: 8,
                  children:
                      anime.genres
                          .map(
                            (genre) => Chip(
                              label: Text(
                                genre,
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: AppColors.background,
                            ),
                          )
                          .toList(),
                ),
              const SizedBox(height: 15),

              // 🔁 Streaming Server Dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Server: ", style: TextStyle(color: Colors.white)),
                  DropdownButton<String>(
                    dropdownColor: Colors.grey[900],
                    value: controller.selectedSource.value,
                    style: const TextStyle(color: Colors.white),
                    onChanged: (newValue) {
                      if (newValue != null) {
                        controller.changeSource(newValue);
                      }
                    },
                    items:
                        ['zoro', 'gogoanime', 'animepahe']
                            .map(
                              (source) => DropdownMenuItem(
                                value: source,
                                child: Text(source.toUpperCase()),
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Watch Now Button
              Center(
                child: ElevatedButton.icon(
                  onPressed:
                      controller.episodes.isNotEmpty
                          ? () => controller.watchEpisode(
                            controller.episodes.first.id,
                          )
                          : null,
                  icon: const Icon(Icons.play_arrow, size: 28),
                  label: const Text(
                    "Watch Now",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "Episodes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              controller.episodes.isEmpty
                  ? const Center(
                    child: Text(
                      "No episodes available.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                  : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.episodes.length,
                    itemBuilder: (context, index) {
                      final episode = controller.episodes[index];
                      return ListTile(
                        title: Text(
                          "Episode ${index + 1}: ${episode.title}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: const Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                        ),
                        onTap: () => controller.watchEpisode(episode.id),
                      );
                    },
                  ),
            ],
          ),
        ),
      );
    });
  }
}
