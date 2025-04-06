import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../details/details_screen.dart';
import '../../models/api/anime_model.dart';

class AnimeCard extends StatelessWidget {
  final Anime anime;

  const AnimeCard({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailsScreen(), arguments: anime);
      },
      child: Column(
        children: [
          // ✅ Anime Card with Rounded Borders
          Container(
            margin: const EdgeInsets.only(right: 12),
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black.withOpacity(0.2),
            ),
            child: Stack(
              children: [
                // ✅ Anime Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    anime.image,
                    fit: BoxFit.cover,
                    height: 190,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        'https://via.placeholder.com/150x200?text=No+Image',
                        fit: BoxFit.cover,
                        height: 190,
                        width: double.infinity,
                      );
                    },
                  ),
                ),

                // ✅ Score Badge (Styled like Image)
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.cyan, // Change to match your theme
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.black, size: 14),
                        const SizedBox(width: 3),
                        Text(
                          anime.score != null ? anime.score.toString() : "0.0",
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

          // ✅ Anime Title
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
