import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/api/anime_model.dart';
import '../../routes/app_routes.dart'; // ✅ import route names

class AnimeCard extends StatelessWidget {
  final Anime anime;

  const AnimeCard({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ✅ Use named route to ensure binding is triggered
        Get.toNamed(AppRoutes.details, arguments: anime);
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black.withOpacity(0.2),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    anime.image,
                    fit: BoxFit.cover,
                    height: 190,
                    width: double.infinity,
                    errorBuilder:
                        (_, __, ___) => Image.network(
                          'https://via.placeholder.com/150x200?text=No+Image',
                          fit: BoxFit.cover,
                          height: 190,
                          width: double.infinity,
                        ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.black, size: 14),
                        const SizedBox(width: 3),
                        Text(
                          anime.score.toStringAsFixed(1),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 130,
            child: Text(
              anime.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
