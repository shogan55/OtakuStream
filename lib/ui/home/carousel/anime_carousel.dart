import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../home/home_controller.dart';
import '../../../utils/app_color.dart';

class AnimeCarousel extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  AnimeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          if (controller.trendingAnime.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.secondary),
            );
          }
          return CarouselSlider.builder(
            itemCount: controller.trendingAnime.length,
            options: CarouselOptions(
              height: 350,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                controller.updateCarouselIndex(index);
              },
            ),
            itemBuilder: (context, index, realIndex) {
              var anime = controller.trendingAnime[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/details', arguments: anime);
                },
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        anime.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 350,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.secondary,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            'https://i.imgur.com/ZR5owtW.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 350,
                          );
                        },
                      ),
                    ),

                    Container(
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
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

                    Positioned(
                      left: 10,
                      bottom: 85,
                      child: SizedBox(
                        width: 250,
                        child: Text(
                          anime.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 10,
                      bottom: 55,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            anime.score.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 10),
                          if (anime.genres.isNotEmpty)
                            Text(
                              anime.genres.first,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                        ],
                      ),
                    ),

                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.toNamed('/player', arguments: anime);
                        },
                        icon: const Icon(Icons.play_arrow, size: 24),
                        label: const Text("Watch Now"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }),

        const SizedBox(height: 10),

        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.trendingAnime.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: controller.currentCarouselIndex.value == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      controller.currentCarouselIndex.value == index
                          ? AppColors.secondary
                          : Colors.grey,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
