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
        Get.to(() => DetailsScreen(), arguments: anime); // ✅ Navigation Fix
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 140, // ✅ Fixed width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Anime Image (Reduced height)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                anime.image,
                fit: BoxFit.cover,
                height: 180, // ✅ Reduced height from 200 to 180
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 5),

            // ✅ Anime Title (Fixed height to avoid overflow)
            SizedBox(
              height: 20, // ✅ Fixed height
              child: Text(
                anime.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14, // ✅ Reduced font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5), // ✅ Added spacing
            // ✅ Rating and Score (Reduced size)
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 14,
                ), // ✅ Smaller icon
                const SizedBox(width: 3),
                Text(
                  anime.score.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ), // ✅ Reduced font size
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
