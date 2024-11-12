import 'package:flutter/material.dart';

class ExplorerMoreView extends StatelessWidget {
  const ExplorerMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00040E),
      appBar: AppBar(
          backgroundColor: const Color(0xFF00040E),
          centerTitle: true,
          title: Text(
            'American Series',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          )),
      body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 110,
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 13),
          itemBuilder: (c, i) => Container(
                width: 173,
                height: 110,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://picsum.photos/id/${i + 100}/300/300",
                    ),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
          // Container(
          //       child: Image.network(
          //         "https://picsum.photos/id/${i + 100}/300/300",
          //         fit: BoxFit.cover,
          //       ),
          //     )
          ),
    );
  }
}
