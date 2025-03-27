import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/api/anime_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Anime anime = Get.arguments; // ✅ Receive anime data properly

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
            // Anime Image & Details
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
                      fontSize: 22,
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
                      style: const TextStyle(color: Colors.white, fontSize: 18),
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
                    anime.genres.map((genre) {
                      return Chip(
                        label: Text(
                          genre,
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.redAccent,
                      );
                    }).toList(),
              ),
            const SizedBox(height: 15),

            // Watch Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () => Get.toNamed('/player', arguments: anime),
                icon: const Icon(Icons.play_arrow, size: 28),
                label: const Text("Watch Now", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
