class Anime {
  final int id;
  final String title;
  final String image;
  final double score;
  final List<String> genres;
  final String videoUrl; // ✅ Added video URL field

  Anime({
    required this.id,
    required this.title,
    required this.image,
    required this.score,
    required this.genres,
    required this.videoUrl, // ✅ Included in constructor
  });

  // ✅ Convert JSON response to Anime object
  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['id'] ?? 0,
      title: json['title']['userPreferred'] ?? 'Unknown',
      image: json['coverImage']['extraLarge'] ?? '',
      score: (json['averageScore'] ?? 0).toDouble(),
      genres:
          (json['genres'] as List<dynamic>?)
              ?.map((g) => g.toString())
              .toList() ??
          [],
      videoUrl: json['videoUrl'] ?? '', // ✅ Fetch from API response
    );
  }

  // ✅ Convert Anime object to JSON (Required for Firebase)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'score': score,
      'genres': genres,
      'videoUrl': videoUrl, // ✅ Store video URL
    };
  }
}
