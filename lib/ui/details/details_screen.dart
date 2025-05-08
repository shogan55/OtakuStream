import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/api/anime_model.dart';
import 'details_controller.dart';
import 'anime_tab_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final anime = Get.arguments as Anime;
    final controller = Get.put(DetailsController(anime));

    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        final a = controller.anime.value;
        if (a == null) return const Center(child: CircularProgressIndicator());

        return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      a.bannerImage.isNotEmpty ? a.bannerImage : a.coverImage,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Get.back(),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: DropdownButton<String>(
                    value: controller.selectedSource.value,
                    dropdownColor: Colors.grey[900],
                    underline: const SizedBox(),
                    icon: const Icon(Icons.stream, color: Colors.white),
                    items:
                        controller.availableSources.map((src) {
                          return DropdownMenuItem<String>(
                            value: src,
                            child: Text(
                              src,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                    onChanged: controller.changeSource,
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      a.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 6,
                      children:
                          a.genres.map((g) {
                            return Chip(
                              label: Text(g),
                              backgroundColor: Colors.cyanAccent.withOpacity(
                                0.2,
                              ),
                              labelStyle: const TextStyle(color: Colors.white),
                            );
                          }).toList(),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      a.description
                          .replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '')
                          .trim(),
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 20),
                    const AnimeTabBar(),
                    const SizedBox(height: 12),
                    controller.selectedTab.value == 0
                        ? buildEpisodeList(controller)
                        : controller.selectedTab.value == 1
                        ? const Text(
                          "📝 Reviews Section (To Be Connected with Firestore)",
                          style: TextStyle(color: Colors.white70),
                        )
                        : const Text(
                          "🔗 Related Anime (Coming Soon)",
                          style: TextStyle(color: Colors.white70),
                        ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget buildEpisodeList(DetailsController controller) {
    return Obx(() {
      if (controller.episodes.isEmpty) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: CircularProgressIndicator(),
          ),
        );
      }

      return Column(
        children:
            controller.episodes.map((e) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.cyanAccent,
                    child: Text(
                      '${e.number}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  title: Text(
                    e.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle:
                      e.description != null
                          ? Text(
                            e.description!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white70),
                          )
                          : null,
                  onTap: () {
                    if (e.url != null && e.url!.isNotEmpty) {
                      Get.toNamed('/player', arguments: e.url);
                    } else {
                      Get.snackbar(
                        "Error",
                        "This episode has no streaming URL.",
                        backgroundColor: Colors.black87,
                        colorText: Colors.white,
                      );
                    }
                  },
                ),
              );
            }).toList(),
      );
    });
  }
}
