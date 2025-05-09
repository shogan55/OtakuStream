import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/anime_card.dart';
import 'carousel/anime_carousel.dart';
import 'home_controller.dart';
import '../../utils/app_color.dart';
import '../../routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Get.offAllNamed(AppRoutes.home);
        break;
      case 1:
        Get.toNamed(AppRoutes.search);
        break;
      case 2:
        Get.toNamed(AppRoutes.genre);
        break;
      case 3:
        Get.toNamed(AppRoutes.watchlist);
      case 4:
        Get.toNamed(AppRoutes.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: AppColors.primary,
        selectedItemColor: AppColors.secondary,
        unselectedItemColor: Colors.white60,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "categories",
          ),
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
            colors: [
              Color.fromARGB(255, 15, 15, 23),
              Color.fromARGB(255, 15, 15, 23),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        Get.toNamed(AppRoutes.settings);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                const SizedBox(height: 10),
                AnimeCarousel(),
                const SizedBox(height: 25),

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
          height: 270,
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
