import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class PlayerController extends GetxController {
  final String url;

  late final VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  var isLoading = true.obs;
  var hasError = false.obs;

  PlayerController({required this.url});

  @override
  void onInit() {
    super.onInit();
    initializePlayer();
  }

  void initializePlayer() async {
    try {
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));

      await videoPlayerController.initialize();

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: false,
        aspectRatio:
            videoPlayerController.value.aspectRatio > 0
                ? videoPlayerController.value.aspectRatio
                : 16 / 9,
      );

      isLoading.value = false;
    } catch (e) {
      print("❌ Player Init Error: $e");
      hasError.value = true;
    }
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.onClose();
  }
}
