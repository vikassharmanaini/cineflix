import 'dart:async';
import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineflix/controllers/playercontroller.dart';
import 'package:cineflix/views/player_module/utils/common.dart';
import 'package:cineflix/views/player_module/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_toast/m_toast.dart';
import 'package:video_player/video_player.dart';

class Player extends StatefulWidget {
  Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final controlller = Get.find<Playercontroller>();
 int index =0;
  @override
  void initState() { 
    super.initState();
    checkstate();
  }
checkstate(){
  Timer.periodic(Duration(milliseconds: 700), (s){
    if(mounted)
    setState(() {
      
    });
  });
  Timer.periodic(Duration(milliseconds: 10000), (s){
    if(mounted)
    setState(() {
     index =1;
    });
     Timer.periodic(Duration(milliseconds: 4000), (s){
    if(mounted)
    setState(() {
     index=0;
      
    });
  });
  });
 
}
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        onPopInvoked: (didPop) {
          if(!controlller.isFullScreen.value){
            controlller.isFullScreen.value=false;
          }
        },
        canPop: !controlller.isFullScreen.value,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: controlller.ontouch,
              child: Center(
                child: SizedBox(
                  height: controlller.isFullScreen.value ? Get.height : 250,
                  child: GestureDetector(
                    // onScaleStart: (details) {
                    //   controlller.previousScale.value = controlller.scale.value;
                    //   controlller.startingFocalPoint.value =
                    //       details.focalPoint / controlller.scale.value;
                    //   controlller.previousOffset.value = controlller.offset.value;
                    // },
                    // onScaleEnd: (details) {
                    //   controlller.previousScale.value = 1.0;
                    // },
                    // onScaleUpdate: (details) {
                    //   controlller.scale.value =
                    //       controlller.previousScale.value * details.scale;
            
                    //   // Calculate offset based on focal point
                    //   Offset delta = details.focalPoint -
                    //       controlller.startingFocalPoint.value;
                    //   controlller.offset.value =
                    //       controlller.previousOffset.value +
                    //           delta / controlller.scale.value;
                    // },
                    child: Transform(
                      transform: Matrix4.identity()
                        ..translate(controlller.offset.value.dx,
                            controlller.offset.value.dy)
                        ..scale(controlller.scale.value),
                      child: AspectRatio(
                          aspectRatio:controlller.isFullScreen.value?Get.width/Get.height: 3.5 / 2,
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
            if(index!=0)
            Positioned(
              left: 40,
              child: RotatedBox(
                quarterTurns: 0,
                child: AnimatedTextKit(
                  repeatForever: true,
                  
                  animatedTexts: [
                   RotateAnimatedText('+10 CNF',
                   
                   transitionHeight: 50,
                   duration: Duration(seconds: 4),rotateOut: false),
                          // RotateAnimatedText(''),
                          // RotateAnimatedText(''),
                ]),
              )),
            if (!controlller.hidecontroller.value)
              Container(
                height: controlller.isFullScreen.value ? Get.height : 250,
                width: Get.width,
                decoration: const BoxDecoration(
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
                                  if (controlller.isFullScreen.value) {
                                    controlller.onfullScreen();
                                  }else{
                                    controlller.controller!.pause();

                                    Get.back();
                                  }
                                },
                                child: const Icon(Icons.arrow_back)),
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.cast),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.settings_outlined),
                          )
                        ],
                      ),
                      Expanded(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: (){
                                  controlller.controller!.seekTo(Duration(seconds: controlller.controller!.value.position.inSeconds-10));
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.fast_rewind_rounded,
                                      size: 30,
                                    ),
                                    Text(
                                      "10 sec",
                                      style: Theme.of(context).textTheme.labelSmall,
                                    )
                                  ],
                                ),
                              ),
                              Obx(
                                ()=> GestureDetector(
                                  onTap: () async {
                                    try {
                                       
                                      !controlller.controller!.value.isPlaying
                                        ? await controlller.controller!.play()
                                        : await controlller.controller!.pause();
                                    } catch (e) {
                                      Get.dialog(AlertDialog(
                                        title: const Text("Error"),
                                        content: Text(e.toString()),
                                      ));
                                    }
                                  },
                                  child: Icon(
                             controlller.isPlaying.value &&   controlller.controller!.value.isPlaying?  Icons.pause  :Icons.play_arrow_rounded,
                                    size: 50,
                                  ),
                                ),
                              ),
                        InkWell(
                          onTap: (){
                            controlller.controller!.seekTo(Duration(seconds: controlller.controller!.value.position.inSeconds+10));
                          },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.fast_forward_rounded,
                                      size: 30,
                                    ),
                                    Text(
                                      "10 sec",
                                      style: Theme.of(context).textTheme.labelSmall,
                                    )
                                  ],
                                ),
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
                                child: const Icon(Icons.fullscreen)),
                          const Spacer(),
                          const Card(
                            color: Colors.white,
                            shape: StadiumBorder(),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
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
                              data: const SliderThemeData(
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
                                  value: controlller.controller!.value.position
                                      .inSeconds
                                      .toDouble(),
                                  min: 0,
                                  max:controlller.controller!.value.duration
                                      .inSeconds
                                      .toDouble(),
                                  

                                  onChanged: (D) async{
                                  ShowMToast(Get.context!).successToast(message: "message", alignment: Alignment.bottomCenter);
                                  await  controlller.controller!.seekTo(
                                        Duration(seconds: D.toInt()));
                                  },
                                  onChangeEnd: (D) {
                                  ShowMToast(Get.context!).successToast(message: "message", alignment: Alignment.bottomCenter);

                                    controlller.controller!.seekTo(
                                        Duration(seconds: D.toInt()));
                                        
                                  }),
                            ),
                          ),
                          horizontal_spacehalf(),
                           SizedBox(
                            width: 60,
                             child: Center(
                               child: Text("${
                                controlller.controller!.value.duration.inHours.toString().length==1?"0":""
                               }${
                                                         controlller.controller!.value.duration.inHours
                                                         }:${
                         (       controlller.controller!.value.duration.inMinutes%60).toString().length==1?"0":""
                               }${
                                                         controlller.controller!.value.duration.inMinutes%60
                                                         }.${
                                (controlller.controller!.value.duration.inMinutes%60).toString().length==1?"0":""
                               }${
                                                         controlller.controller!.value.duration.inSeconds%60
                                                         }"),
                             ),
                           ),
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
      ),
    );
  }

  Widget ActionBuilder(String label, IconData icon, ontap) {
    return SizedBox(
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
