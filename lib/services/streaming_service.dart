import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/api/anime_model.dart';
import '../../models/api/episode_model.dart';

class StreamingService {
  static const String baseUrl = 'https://consumetapi-sable.vercel.app';

  static Future<List<Episode>> fetchEpisodes(
    Anime anime,
    String provider,
  ) async {
    try {
      final int anilistId = anime.id;
      final url =
          '$baseUrl/meta/anilist/episodes/$anilistId?provider=${provider.toLowerCase()}';

      print("📡 Fetching episodes from $provider: $url");

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is List) {
          print("📦 Response Type: List<dynamic>");
          return data.map((e) => Episode.fromJson(e)).toList();
        }

        if (data is Map<String, dynamic>) {
          final episodes = data['episodes'];
          if (episodes is List) {
            print("📦 Extracted episodes from map");
            return episodes.map((e) => Episode.fromJson(e)).toList();
          } else {
            print("❗ 'episodes' is not a list: $episodes");
          }
        } else {
          print("❗ Unexpected data format: $data");
        }
      } else {
        print("❌ Failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print('❌ Error fetching episodes: $e');
    }

    return [];
  }
}
