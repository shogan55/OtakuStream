class Episode {
  final String id;
  final String title;
  final String url;

  Episode({required this.id, required this.title, required this.url});

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'].toString(), // ✅ Convert ID to String
      title: json['title'] ?? 'Unknown',
      url: json['url'] ?? '',
    );
  }
}
