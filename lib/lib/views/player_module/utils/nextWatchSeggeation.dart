import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineflix/views/player_module/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextWatch extends StatelessWidget {
  const NextWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Next To Watch",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          vertical_space(),
          SizedBox(
            height: 220,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 300,
                      height: 220,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                "https://picsum.photos/id/$index/300/220")),
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )),
          ),
          vertical_space2()
        ],
      ),
    );
  }
}
