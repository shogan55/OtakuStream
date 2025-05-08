import 'package:flutter/material.dart';

class EpisodeButton extends StatelessWidget {
  final VoidCallback onTap;
  const EpisodeButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: const Icon(Icons.play_arrow),
      label: const Text("View Episodes"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.cyanAccent.shade400,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class UsersLovedThis extends StatelessWidget {
  final List<String> avatars;
  const UsersLovedThis({required this.avatars, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < avatars.length; i++)
          PositionedAvatar(imageUrl: avatars[i], index: i),
        const SizedBox(width: 8),
        Text(
          "+${avatars.length} loved this",
          style: TextStyle(color: Colors.grey[300]),
        ),
      ],
    );
  }
}

class PositionedAvatar extends StatelessWidget {
  final String imageUrl;
  final int index;

  const PositionedAvatar({
    required this.imageUrl,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: index * 20.0),
      child: CircleAvatar(backgroundImage: NetworkImage(imageUrl), radius: 16),
    );
  }
}

class AltTitle extends StatelessWidget {
  final String? title;
  const AltTitle({this.title, super.key});

  @override
  Widget build(BuildContext context) {
    if (title == null || title!.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "English Title",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(title!, style: const TextStyle(fontSize: 16, color: Colors.white)),
      ],
    );
  }
}

class AnimeDetailsText extends StatelessWidget {
  final String? description;
  const AnimeDetailsText({this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      description
              ?.replaceAll('<br>', '\n')
              .replaceAll(RegExp(r'<[^>]*>'), '') ??
          "No description available.",
      style: const TextStyle(fontSize: 14, color: Colors.white70),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings, color: Colors.white),
      onPressed: () {},
    );
  }
}
