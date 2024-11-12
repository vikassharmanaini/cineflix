import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SerchViews extends StatelessWidget {
  const SerchViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00040E),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF33363C),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.mic),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search for a show, movie, gener etc.",
                  hintStyle: TextStyle(
                    color: Color(0xFFC4C4C4),
                    fontSize: 17.44,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                    letterSpacing: 0.24,
                  ),
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 60,
            width: Get.width,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Top Searches',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.67,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                    height: 0.02,
                    letterSpacing: -0.08,
                  ),
                ),
              ],
            ),
          ),
          for (int i in List.generate(3, (i) => i))
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
              width: Get.width,
              height: 87.15,
              decoration: BoxDecoration(color: Color(0xFF33363C)),
              child: Row(
                children: [
                  Container(
                    width: 167.41,
                    height: 108.93,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/167x109"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                    'All of us are dead',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.88,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                      letterSpacing: 0.86,
                    ),
                  )),
                  Icon(Icons.play_circle_outline_outlined),
                  SizedBox(width: 20),
                ],
              ),
            )
        ],
      )),
    );
  }
}
