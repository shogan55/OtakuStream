import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class PlayerController extends GetxController {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    final String videoUrl = Get.arguments;
    if (videoUrl.isNotEmpty) {
      initializePlayer(videoUrl);
    } else {
      Get.snackbar("Error", "Invalid video URL");
    }
  }

  void initializePlayer(String url) async {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    await videoPlayerController!.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: false,
      showControls: true,
    );

    isLoading.value = false;
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    super.onClose();
  }
}
