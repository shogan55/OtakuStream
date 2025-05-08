import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';
import 'player_controller.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String url = Get.arguments;
    final controller = Get.put(PlayerController(url: url));

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Now Playing", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Obx(() {
        if (controller.hasError.value) {
          return const Center(
            child: Text(
              "❌ Failed to load video",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Center(
          child: AspectRatio(
            aspectRatio: controller.videoPlayerController.value.aspectRatio,
            child: Chewie(controller: controller.chewieController!),
          ),
        );
      }),
    );
  }
}
