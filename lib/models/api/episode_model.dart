class Episode {
  final int number;
  final String title;
  final String id;
  final String image;
  final String? description;
  final String? url;

  Episode({
    required this.number,
    required this.title,
    required this.id,
    required this.image,
    this.description,
    this.url,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      number: int.tryParse(json['number'].toString()) ?? 0,
      title: json['title']?.toString() ?? 'Untitled',
      id: json['id']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      description: json['description']?.toString(),
      url: json['url']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'title': title,
      'id': id,
      'image': image,
      'description': description,
      'url': url,
    };
  }
}
