import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineflix/controllers/playercontroller.dart';
import 'package:cineflix/views/player_module/utils/common.dart';
import 'package:cineflix/views/player_module/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class Player extends StatelessWidget {
  Player({super.key});
  final controlller = Get.find<Playercontroller>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          GestureDetector(
            onTap: controlller.ontouch,
            child: Center(
              child: Container(
                height: controlller.isFullScreen.value ? Get.height : 250,
                child: GestureDetector(
                  onScaleStart: (details) {
                    controlller.previousScale.value = controlller.scale.value;
                    controlller.startingFocalPoint.value =
                        details.focalPoint / controlller.scale.value;
                    controlller.previousOffset.value = controlller.offset.value;
                  },
                  onScaleEnd: (details) {
                    controlller.previousScale.value = 1.0;
                  },
                  onScaleUpdate: (details) {
                    controlller.scale.value =
                        controlller.previousScale.value * details.scale;

                    // Calculate offset based on focal point
                    Offset delta = details.focalPoint -
                        controlller.startingFocalPoint.value;
                    controlller.offset.value =
                        controlller.previousOffset.value +
                            delta / controlller.scale.value;
                  },
                  child: Transform(
                    transform: Matrix4.identity()
                      ..translate(controlller.offset.value.dx,
                          controlller.offset.value.dy)
                      ..scale(controlller.scale.value),
                    child: AspectRatio(
                        aspectRatio: 3.5 / 2,
                        child: Get.find<Playercontroller>().initialized
                            ? AspectRatio(
                                aspectRatio: Get.find<Playercontroller>()
                                    .controller!
                                    .value
                                    .aspectRatio,
                                child: VideoPlayer(
                                    Get.find<Playercontroller>().controller!),
                              )
                            : CachedNetworkImage(
                                imageUrl:
                                    "https://static1.srcdn.com/wordpress/wp-content/uploads/2023/03/matthew_mcconaughey_on_the_poster_for_interstellar-1.jpg",
                                fit: BoxFit.fill)),
                  ),
                ),
              ),
            ),
          ),
          if (!controlller.hidecontroller.value)
            Container(
              height: controlller.isFullScreen.value ? Get.height : 250,
              width: Get.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black45,
                    Colors.black12,
                    Colors.black26,
                  ])),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap: () {
                                if (controlller.isFullScreen.value)
                                  controlller.onfullScreen();
                              },
                              child: Icon(Icons.arrow_back)),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.cast),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.settings_outlined),
                        )
                      ],
                    ),
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.fast_rewind_rounded,
                                  size: 30,
                                ),
                                Text(
                                  "10 sec",
                                  style: Theme.of(context).textTheme.labelSmall,
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () async {
                                controlller.controller!.value!.isPlaying
                                    ? await controlller.controller!.play()
                                    : await controlller.controller!.pause();
                              },
                              child: Icon(
                                Icons.play_arrow_rounded,
                                size: 50,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.fast_forward_rounded,
                                  size: 30,
                                ),
                                Text(
                                  "10 sec",
                                  style: Theme.of(context).textTheme.labelSmall,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        horizontal_space(),
                        if (!controlller.isFullScreen.value)
                          InkWell(
                              onTap: () {
                                controlller.onfullScreen();
                              },
                              child: Icon(Icons.fullscreen)),
                        Spacer(),
                        Card(
                          color: Colors.white,
                          shape: StadiumBorder(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5),
                            child: Text(
                              "Skip Intro",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        horizontal_space(),
                      ],
                    ),
                    vertical_spacehalf(),
                    Row(
                      children: [
                        Expanded(
                          child: SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 2,
                              overlayShape: RoundSliderOverlayShape(
                                  overlayRadius: 0.0), //
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 5.0),
                            ),
                            child: Slider(
                                allowedInteraction:
                                    SliderInteraction.slideThumb,
                                secondaryTrackValue: 0.4,
                                thumbColor: Colors.amber,
                                activeColor: AppThemes().primmaryBottonColor,
                                value: 0.3,
                                onChanged: (D) {}),
                          ),
                        ),
                        horizontal_spacehalf(),
                        Text("1:30.00"),
                        horizontal_space()
                      ],
                    ),
                    if (controlller.isFullScreen.value)
                      SizedBox(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ActionBuilder("Rewards",
                                Icons.wallet_giftcard_rounded, () {}),
                            ActionBuilder("Quality", Icons.hd_rounded, () {}),
                            ActionBuilder("Speed", Icons.speed, () {}),
                            ActionBuilder(
                                "Audio & Subtitle", Icons.subtitles, () {}),
                            ActionBuilder("Next Episodes",
                                Icons.skip_next_rounded, () {}),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget ActionBuilder(String label, IconData icon, ontap) {
    return Container(
      width: 120,
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          Text(
            label,
            style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(),
          )
        ],
      ),
    );
  }
}
