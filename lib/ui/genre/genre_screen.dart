import 'package:flutter/material.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Genres")),
      body: const Center(child: Text("Browse by Genre")),
    );
  }
}
