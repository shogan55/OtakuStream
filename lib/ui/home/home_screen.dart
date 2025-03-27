import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/anime_card.dart';
import 'carousel/anime_carousel.dart';
import 'home_controller.dart';
import '../../utils/app_color.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primary,
        selectedItemColor: AppColors.secondary,
        unselectedItemColor: Colors.white60,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Watchlist",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1E1E2C), Color(0xFF252538)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Top Bar with Left-Aligned Title and Right Settings Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "OtakuStream",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () {
                        // Settings Page Navigation
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // ✅ Trending Anime Carousel
                AnimeCarousel(),
                const SizedBox(height: 20),

                // ✅ Horizontal Scrolling Sections
                buildHorizontalSection("📡 Top Airing", controller.topAiring),
                buildHorizontalSection("🔥 Top Ranked", controller.topRanked),
                buildHorizontalSection("📢 Top Popular", controller.topPopular),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Title for Each Section
  Widget buildHorizontalSection(String title, RxList animeList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 230, // ✅ Fixed height for horizontal scroll
          child: Obx(() {
            if (animeList.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.secondary),
              );
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: animeList.length,
              itemBuilder: (context, index) {
                return AnimeCard(anime: animeList[index]);
              },
            );
          }),
        ),
      ],
    );
  }
}
