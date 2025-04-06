class Anime {
  final int id;
  final String title;
  final String image;
  final double score;
  final List<String> genres;
  final String videoUrl;

  Anime({
    required this.id,
    required this.title,
    required this.image,
    required this.score,
    required this.genres,
    required this.videoUrl,
  });

  /// ✅ Convert JSON to Anime Object
  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['id'] ?? 0,
      title: json['title']?['userPreferred'] ?? 'Unknown',
      image:
          json['coverImage']?['extraLarge'] ??
          json['coverImage']?['large'] ??
          json['coverImage']?['medium'] ??
          'https://i.imgur.com/ZR5owtW.jpg',
      score: (json['averageScore'] ?? 0).toDouble(),
      genres:
          (json['genres'] as List<dynamic>?)
              ?.map((g) => g.toString())
              .toList() ??
          [],
      videoUrl:
          json['trailer']?['id'] != null
              ? 'https://www.youtube.com/watch?v=${json['trailer']['id']}'
              : '',
    );
  }

  /// ✅ Convert Anime Object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': {
        'userPreferred':
            title, // 🔥 Store in correct structure for future decoding
      },
      'coverImage': {'extraLarge': image},
      'averageScore': score,
      'genres': genres,
      'trailer': {'id': videoUrl.isNotEmpty ? videoUrl.split('v=').last : null},
    };
  }
}
