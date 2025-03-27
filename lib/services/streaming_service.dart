import 'package:dio/dio.dart';
import '../../models/api/episode_model.dart'; // ✅ Import Episode model

class StreamingService {
  final Dio _dio = Dio();
  final String baseUrl = "https://gogoanime.consumet.stream";

  // ✅ Fetch episodes for an anime
  Future<List<Episode>> fetchEpisodes(String animeId) async {
    try {
      final response = await _dio.get('$baseUrl/anime/$animeId');
      List episodes = response.data['episodes'];
      return episodes.map((e) => Episode.fromJson(e)).toList();
    } catch (e) {
      print('Error fetching episodes: $e');
      return [];
    }
  }

  // ✅ Get streaming link for a specific episode
  Future<String> getEpisodeStreamUrl(String episodeId) async {
    try {
      final response = await _dio.get('$baseUrl/episode/$episodeId');
      return response.data['videoUrl'] ?? '';
    } catch (e) {
      print('Error fetching stream URL: $e');
      return '';
    }
  }
}
