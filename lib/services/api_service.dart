import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api/anime_model.dart';

class ApiService {
  static const String _baseUrl = "https://graphql.anilist.co";

  // ✅ Fetch Trending Anime (Fixed Query)
  static Future<List<Anime>> fetchTrendingAnime() async {
    const String query = '''
    query {
      Page(perPage: 10) {
        media(sort: TRENDING_DESC, type: ANIME) {
          id
          title { userPreferred }
          coverImage { extraLarge large medium }
          averageScore
          genres
          trailer { id }
        }
      }
    }
    ''';

    return _fetchAnimeData(query);
  }

  // ✅ Fetch Top Airing Anime
  static Future<List<Anime>> fetchTopAiring() async {
    const String query = '''
    query {
      Page(perPage: 10) {
        media(sort: POPULARITY_DESC, type: ANIME, status: RELEASING) {
          id
          title { userPreferred }
          coverImage { extraLarge large medium }
          averageScore
          genres
          trailer { id }
        }
      }
    }
    ''';

    return _fetchAnimeData(query);
  }

  // ✅ Fetch Top Ranked Anime
  static Future<List<Anime>> fetchTopRanked() async {
    const String query = '''
    query {
      Page(perPage: 10) {
        media(sort: SCORE_DESC, type: ANIME) {
          id
          title { userPreferred }
          coverImage { extraLarge large medium }
          averageScore
          genres
          trailer { id }
        }
      }
    }
    ''';

    return _fetchAnimeData(query);
  }

  // ✅ Fetch Top Popular Anime
  static Future<List<Anime>> fetchTopPopular() async {
    const String query = '''
    query {
      Page(perPage: 10) {
        media(sort: POPULARITY_DESC, type: ANIME) {
          id
          title { userPreferred }
          coverImage { extraLarge large medium }
          averageScore
          genres
          trailer { id }
        }
      }
    }
    ''';

    return _fetchAnimeData(query);
  }

  // ✅ Search Anime by Name
  static Future<List<Anime>> searchAnime(String search) async {
    const String query = '''
    query (\$search: String) {
      Page(perPage: 10) {
        media(search: \$search, type: ANIME) {
          id
          title { userPreferred }
          coverImage { extraLarge large medium }
          averageScore
          genres
          trailer { id }
        }
      }
    }
    ''';

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "query": query,
        "variables": {"search": search},
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['data']['Page']['media'] as List)
          .map((anime) => Anime.fromJson(anime))
          .toList();
    } else {
      throw Exception("❌ Failed to fetch search results: ${response.body}");
    }
  }

  // ✅ Helper function to fetch data
  static Future<List<Anime>> _fetchAnimeData(String query) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"query": query}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['data']['Page']['media'] as List)
          .map((anime) => Anime.fromJson(anime))
          .toList();
    } else {
      throw Exception("❌ Failed to load anime data: ${response.body}");
    }
  }
}
