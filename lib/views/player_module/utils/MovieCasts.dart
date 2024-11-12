import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineflix/views/player_module/utils/%20temdata.dart';
import 'package:cineflix/views/player_module/utils/common.dart';
import 'package:cineflix/views/player_module/utils/themes.dart';
import 'package:flutter/material.dart';

class Moviecasts extends StatelessWidget {
  const Moviecasts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Cast",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          vertical_space(),
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 180,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                maxCrossAxisExtent: 150),
            children: [
              for (var i in TempData().tempCast)
                Container(
                  padding: EdgeInsets.all(5),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter:
                            ColorFilter.mode(Colors.black87, BlendMode.dstIn),
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(i['image'])),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${i['name']}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${i['cast']}",
                        style: AppThemes().inactiveTextStyle(),
                      )
                    ],
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
