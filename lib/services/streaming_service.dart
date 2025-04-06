import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api/episode_model.dart';
import '../models/api/anime_model.dart';

class StreamingService {
  static const String baseUrl = 'https://consumetapi-sable.vercel.app';

  static Future<List<Episode>> fetchEpisodes(
    Anime anime,
    String provider,
  ) async {
    try {
      final int anilistId = anime.id;

      // ✅ Step 1: Fetch synced episodes using AniList ID with provider
      final url =
          '$baseUrl/meta/anilist/episodes/$anilistId?provider=$provider';
      print("📡 Fetching from: $url");

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final episodes = data['episodes'] as List?;

        if (episodes != null && episodes.isNotEmpty) {
          print('🎉 Fetched ${episodes.length} episodes from $provider');
          return episodes.map((e) => Episode.fromJson(e)).toList();
        } else {
          throw Exception('❌ No episodes found.');
        }
      } else {
        throw Exception('❌ Failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Exception occurred while fetching episodes: $e');
      throw Exception('Failed to load episodes');
    }
  }
}
