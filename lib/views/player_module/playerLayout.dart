import 'package:cineflix/controllers/playercontroller.dart';
import 'package:cineflix/views/player_module/player.dart';
import 'package:cineflix/views/player_module/playerInfo.dart';
import 'package:cineflix/views/player_module/utils/MovieCasts.dart';
import 'package:cineflix/views/player_module/utils/common.dart';
import 'package:cineflix/views/player_module/utils/nextWatchSeggeation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerModule extends StatelessWidget {
  PlayerModule({super.key});
  final _playerController = Get.put(Playercontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => SafeArea(
              top: false,
              // !_playerController.isFullScreen.value,
              bottom: !_playerController.isFullScreen.value,
              right: !_playerController.isFullScreen.value,
              left: !_playerController.isFullScreen.value,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SingleChildScrollView(
                    child: Obx(
                      () => Column(
                        children: [
                          !_playerController.isPlaying.value
                              ? Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      height:500,
                                      child: Image.network(
                                        "https://images-cdn.ubuy.co.in/6352289f38bb253c44612d53-interstellar-movie-poster-24-x-36-inches.jpg",
                                        height:500,
                                        scale: 3,
                                        width: constraints.maxWidth,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                      height: 170,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                            const Color.fromARGB(255, 0, 0, 0),
                                            const Color.fromARGB(147, 0, 0, 0),
                                            const Color(0x1F00040E)
                                          ])),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          titleWidget(context),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              : Player(),
                          if (!_playerController.isFullScreen.value) PlayInfo(),
                          if (!_playerController.isFullScreen.value)
                            Moviecasts(),
                          if (!_playerController.isFullScreen.value)
                            vertical_space(),
                          if (!_playerController.isFullScreen.value)
                            Divider(
                              indent: 20,
                              endIndent: 20,
                              color: Colors.white,
                              height: 1,
                              thickness: 1,
                            ),
                          if (!_playerController.isFullScreen.value)
                            vertical_space(),
                          if (!_playerController.isFullScreen.value) NextWatch()
                        ],
                      ),
                    ),
                  );
                },
              ),
            )));
  }
}
