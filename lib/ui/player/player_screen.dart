import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    final String videoUrl = Get.arguments;

    if (videoUrl.isNotEmpty) {
      print("🎥 Playing video from URL: $videoUrl");
      _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
        ..initialize()
            .then((_) {
              _chewieController = ChewieController(
                videoPlayerController: _controller,
                aspectRatio:
                    _controller.value.aspectRatio > 0
                        ? _controller.value.aspectRatio
                        : 16 / 9,
                autoPlay: true,
                looping: false,
                showControls: true,
              );
              setState(() => isLoading = false);
            })
            .catchError((error) {
              print("❌ Video initialization failed: $error");
            });
    } else {
      print("❌ Error: Empty video URL received.");
      Get.back();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Now Playing', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child:
            isLoading
                ? const CircularProgressIndicator()
                : Chewie(controller: _chewieController),
      ),
    );
  }
}
