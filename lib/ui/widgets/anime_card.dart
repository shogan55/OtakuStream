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
        Get.to(() => DetailsScreen(), arguments: anime); // ✅ Fix navigation
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Anime Image with Rounded Borders
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                anime.image,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 5),

            // ✅ Anime Title with Overflow Fix
            Text(
              anime.title,
              maxLines: 1, // Prevents overflow
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            // ✅ Rating and Score
            Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow, size: 16),
                const SizedBox(width: 4),
                Text(
                  anime.score.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
