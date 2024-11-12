import 'package:cineflix/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Downloadview extends StatelessWidget {
  const Downloadview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00040E),
        centerTitle: true,
        title: Text(
          'Downloads',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFF00040E),
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: 54,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 109,
                    child: Text(
                      '5 Videos',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Text(
                    'Select',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFFF2AA4C),
                      fontSize: 12,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w500,
                      height: 0.12,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (c, i) => Container(
                          child: Row(
                        children: [
                          Container(
                            width: 128,
                            height: 80,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/128x80"),
                                fit: BoxFit.cover,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'All of us are dead ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '3 Episodes',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.w400,
                                          height: 0.12,
                                        ),
                                      ),
                                      const SizedBox(width: 7),
                                      Container(
                                        width: 4,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 4,
                                              height: 4,
                                              decoration: ShapeDecoration(
                                                color: Color(0xFFF2AA4C),
                                                shape: OvalBorder(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        '723 MB',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.w400,
                                          height: 0.12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.downloading_rounded,
                            color: AppColors().indicator,
                          )
                        ],
                      )),
                  separatorBuilder: (c, i) => Divider(),
                  itemCount: 20),
            )
          ],
        ),
      ),
    );
  }
}
