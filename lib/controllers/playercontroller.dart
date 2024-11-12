import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class Playercontroller extends GetxController {
  VideoPlayerController? controller;
  playvideo() {
    controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://sample-videos.com/video321/mp4/240/big_buck_bunny_240p_30mb.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        isPlaying.value = true;
        controller!.play();
      });
  }

  RxBool isFullScreen = false.obs;
  RxBool isPlaying = false.obs;
  RxBool hidecontroller = false.obs;
  RxDouble scale = 1.0.obs;
  RxDouble previousScale = 1.0.obs;
  Rx<Offset> offset = Offset.zero.obs;
  Rx<Offset> startingFocalPoint = Offset.zero.obs;
  Rx<Offset> previousOffset = Offset.zero.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _hideController(3);
    hidecontroller.listen(_hideController);
  }

  ontouch() {
    hidecontroller.value = false;
  }

  _hideController(onchage) async {
    if (!hidecontroller.value) {
      await Future.delayed(Duration(seconds: 5), () {
        hidecontroller.value = true;
      });
    }
  }

  onfullScreen() {
    isFullScreen.value = !isFullScreen.value;
    SystemChrome.setPreferredOrientations(!isFullScreen.value
        ? [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
        : [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIMode(isFullScreen.value
        ? SystemUiMode.immersiveSticky
        : SystemUiMode.edgeToEdge);
  }
}
