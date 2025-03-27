import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../../services/streaming_service.dart';

class PlayerController extends GetxController {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  var isLoading = true.obs;
  final StreamingService _streamingService = StreamingService();

  @override
  void onInit() {
    super.onInit();
    fetchVideo();
  }

  void fetchVideo() async {
    String episodeId = Get.arguments;
    String? url = await _streamingService.getEpisodeStreamUrl(episodeId);

    if (url.isNotEmpty) {
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
    } else {
      Get.snackbar("Error", "No streaming URL found!");
    }
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    super.onClose();
  }
}
