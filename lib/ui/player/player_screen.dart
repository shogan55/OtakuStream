import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';
import '../../ui/player/player_controller.dart';

class PlayerScreen extends StatelessWidget {
  final PlayerController controller = Get.put(PlayerController());

  PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Now Streaming",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const CircularProgressIndicator(color: Colors.redAccent);
          }
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: Chewie(controller: controller.chewieController!),
          );
        }),
      ),
    );
  }
}
