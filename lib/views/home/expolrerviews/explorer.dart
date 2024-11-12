import 'dart:developer';

import 'package:cineflix/core/models/contentModel.dart';
import 'package:cineflix/core/services/api_service.dart';
import 'package:cineflix/resources/colors.dart';
import 'package:cineflix/views/home/expolrerviews/explorerView.dart';
import 'package:cineflix/views/movieSeries.dart';
import 'package:cineflix/views/player_module/playerLayout.dart';
import 'package:cineflix/widgets/AppButtons.dart';
import 'package:cineflix/widgets/commonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabler_icons/tabler_icons.dart';

class ExplorerView extends StatelessWidget {
  const ExplorerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              posterbanner(), //Poster Banner
              height_space(20),
              tablist(), //tablist
              height_space(30),
              explorelist(label: "Trendings"),
              // FutureBuilder(
              //     future: ApiService().getNewRelease(),
              //     builder: (context, snapshot) {
              //       return explorelist(
              //           label: "New Release",
              //           showloader: !snapshot.hasData,
              //           content: snapshot.hasData
              //               ? ((snapshot.data!.data["latestReleases"] as List)
              //                   .map((e) {
              //                   return MediaContent.fromJson(e);
              //                 }).toList())
              //               : null);
              //     }), //Explorer List
              height_space(30),
              explorelist(label: "Hindi Movies"),
              // FutureBuilder(
              //     future: ApiService().getTranding(),
              //     builder: (context, snapshot) {
              //       return explorelist(
              //           label: "Trending Now",
              //           showloader: !snapshot.hasData,
              //           content: snapshot.hasData
              //               ? ((snapshot.data!.data['trends'] as List).map((e) {
              //                   return MediaContent.fromJson(e);
              //                 }).toList())
              //               : null);
              //     }), //Explorer List
              height_space(30),

              explorelist(label: "Hindi Movies"), //Explorer List
              height_space(30),

              explorelist(label: "American Series"), //Explorer List
              height_space(30),

              explorelist(label: "Thriller And Mysteries"), //Explorer List
              height_space(30),

              explorelist(label: "US TV Show"), //Explorer List
              height_space(100),
            ],
          ),
        ),
      ),
    );
  }

  Widget explorelist(
      {String? label,
      bool islabeled = false,
      bool? showloader,
      List<MediaContent>? content}) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              label ?? 'Continue Watching for Raj',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23.99,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w700,
                height: 0.03,
                letterSpacing: -0.07,
              ),
            ),
          ),
          height_space(14),
          SizedBox(
            height: !islabeled ? 120 : 135,
            child: showloader == true
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: content != null ? content.length + 1 : 10,
                    itemBuilder: (c, i) {
                      MediaContent? mediaContent;
                      try {
                        mediaContent = content != null ? content[i] : null;
                      } catch (e) {
                        // TODO
                      }
                      return Material(
                        child: InkWell(
                          onTap: () {
                            if (i ==
                                ((content != null ? content.length + 1 : 10) -
                                    1))
                              Get.to(() => ExplorerMoreView());
                            else {
                              Get.to(() => PlayerModule());
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: 153,
                                height: 100,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(mediaContent != null
                                        ? "${mediaContent.posterUrl!.replaceAll('ibb', 'i.ibb')}/image.png"
                                        : "https://via.placeholder.com/153x100"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              if (islabeled)
                                SizedBox(
                                  width: 155,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      width_space(5),
                                      Text('S03E04',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.21,
                                            fontFamily: 'Sora',
                                            fontWeight: FontWeight.w400,
                                            height: 0.14,
                                            letterSpacing: 0.52,
                                          )),
                                      Spacer(),
                                      Text(
                                        '23:58',
                                        style: TextStyle(
                                          color: Color(0xFF8596A2),
                                          fontSize: 10.35,
                                          fontFamily: 'Sora',
                                          fontWeight: FontWeight.w400,
                                          height: 0.14,
                                          letterSpacing: 0.17,
                                        ),
                                      ),
                                      width_space(5),
                                    ],
                                  ),
                                )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }

  SizedBox tablist() {
    return SizedBox(
      height: 35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (c, i) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: ShapeDecoration(
                  color: i != 1 ? Colors.transparent : Color(0xFFF2AA4C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Movies',
                    style: TextStyle(
                      color: i != 1 ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                    ),
                  ),
                ),
              )),
    );
  }

  Stack posterbanner() {
    return Stack(
      children: [
        Container(
            width: Get.width,
            height: 448,
            color: Colors.white,
            child: Image.network(
              "https://m.media-amazon.com/images/I/61OmlO9stnL.jpg",
              fit: BoxFit.cover,
            )),
        Container(
          height: 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Colors.black, Colors.black.withOpacity(0)],
            ),
          ),
          child: SafeArea(
            child: Row(
              children: [
                width_space(20),
                logoWidget(height: 30),
                Spacer(),
                Icon(Icons.cast),
                width_space(20),
                Icon(
                  TablerIcons.user_circle,
                  color: AppColors().indicator,
                ),
                width_space(20),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 430,
            height: 187,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.7)
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.info_outline),
                        Text(
                          "Info",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    width_space(40),
                    AppButtons().primary_button(
                        width: 140.0, height: 45.0, label: "Watch now"),
                    width_space(40),
                  ],
                ),
                height_space(20),
                Center(child: onboardIndicator(1, 5)),
                height_space(10),
              ],
            ),
          ),
        )
      ],
    );
  }
}
