class Anime {
  final int id;
  final String title; // User preferred title
  final String titleEnglish; // English title
  final String image; // Fallback image (usually cover)
  final String coverImage; // Cover image (larger)
  final String bannerImage; // Banner background image
  final double score; // Average score
  final List<String> genres; // Genre list
  final String videoUrl; // YouTube trailer URL
  final String status; // Status: FINISHED, RELEASING, etc.
  final String type; // Format: TV, MOVIE, etc.
  final String rating; // Age rating: PG-13, R, etc.
  final String description; // Synopsis
  final int episodesCount; // Total episodes

  Anime({
    required this.id,
    required this.title,
    required this.titleEnglish,
    required this.image,
    required this.coverImage,
    required this.bannerImage,
    required this.score,
    required this.genres,
    required this.videoUrl,
    required this.status,
    required this.type,
    required this.rating,
    required this.description,
    required this.episodesCount,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    final trailerId = json['trailer']?['id'];
    return Anime(
      id: json['id'] ?? 0,
      title: json['title']?['userPreferred'] ?? 'Unknown Title',
      titleEnglish: json['title']?['english'] ?? '',
      image: json['coverImage']?['medium'] ?? 'https://i.imgur.com/ZR5owtW.jpg',
      coverImage:
          json['coverImage']?['extraLarge'] ??
          json['coverImage']?['large'] ??
          json['coverImage']?['medium'] ??
          'https://i.imgur.com/ZR5owtW.jpg',
      bannerImage: json['bannerImage'] ?? '',
      score: (json['averageScore'] ?? 0).toDouble(),
      genres: List<String>.from(json['genres'] ?? []),
      videoUrl:
          trailerId != null ? 'https://www.youtube.com/watch?v=$trailerId' : '',
      status: json['status'] ?? 'Unknown',
      type: json['format'] ?? 'Unknown',
      rating: json['rating'] ?? 'N/A',
      description: json['description'] ?? 'No description available.',
      episodesCount: json['episodes'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': {'userPreferred': title, 'english': titleEnglish},
      'coverImage': {'extraLarge': coverImage, 'medium': image},
      'bannerImage': bannerImage,
      'averageScore': score,
      'genres': genres,
      'trailer': {'id': videoUrl.isNotEmpty ? videoUrl.split('v=').last : null},
      'status': status,
      'format': type,
      'rating': rating,
      'description': description,
      'episodes': episodesCount,
    };
  }
}
