import 'package:cineflix/controllers/playercontroller.dart';
import 'package:get/get.dart';

import './utils/WidgetModels.dart';
import './utils/themes.dart';
import './utils/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayInfo extends StatelessWidget {
  PlayInfo({super.key});
  final controller = Get.find<Playercontroller>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            if (controller.isPlaying.value) titleWidget(context),
            vertical_space2(),
            //vertical_button
            playerbutton(),
            vertical_space2(),
            //horizontal_action_buttons
            playeractions(),
            vertical_space2(),
            description(context),
            vertical_spacehalf(),
            specification(),
          ],
        ),
      ),
    );
  }

  Text description(BuildContext context) {
    return Text(
        "An Indian agent races against a doomsday clock as a ruthless mercenary, with a bitter vendetta, mounts an apocalyptic attack against the country.",
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 14, fontWeight: FontWeight.w500));
  }

  Column specification() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "IMDb 8.4",
          style: AppThemes().inactiveTextStyle(),
        ),
        vertical_spacehalf(),
        Text(
          "Languages: Audio (12), Subtitles (35)",
          style: AppThemes().inactiveTextStyle(),
        ),
        vertical_spacehalf(),
        Text(
          "Genre: Drama, Action,  Patriotic",
          style: AppThemes().inactiveTextStyle(),
        ),
      ],
    );
  }

  SizedBox playerbutton() {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: FloatingActionButton.extended(
                backgroundColor: AppThemes().primmaryBottonColor,
                foregroundColor: AppThemes().activetextColor,
                heroTag: "resume",
                icon: Icon(Icons.play_arrow_rounded),
                onPressed: () {},
                label: Text("Resume")),
          ),
          horizontal_space2(),
          Expanded(
            child: FloatingActionButton.extended(
                backgroundColor: AppThemes().secondryButtonColor,
                heroTag: "download",
                icon: Icon(Icons.file_download_outlined),
                onPressed: () {},
                label: Text("Download")),
          )
        ],
      ),
    );
  }

  Row playeractions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var item in WidgetModels().playerButtonOptions())
          Container(
            child: Column(
              children: [
                Icon(item['icon']),
                vertical_space(),
                Text("${item['text']}")
              ],
            ),
          )
      ],
    );
  }
}

Widget titleWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Movie Name",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          vertical_spacehalf(),
          Text(
            "2023 1 h 44 min A UHD",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
      InkWell(
        onTap: () {
          Get.find<Playercontroller>().playvideo();
        },
        child: Column(
          children: [
            Icon(Icons.videocam_outlined),
            Text(
              "Trailer",
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),
      )
    ],
  );
}
