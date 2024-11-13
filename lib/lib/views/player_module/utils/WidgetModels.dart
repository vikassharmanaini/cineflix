import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetModels {
  List<Map> playerButtonOptions() => [
        {
          "icon": Icons.thumb_up_alt_outlined,
          "text": "Like",
        },
        {
          "icon": Icons.thumb_down_alt_outlined,
          "text": "Dislike",
        },
        {
          "icon": Icons.add,
          "text": "Watchlist",
        },
        {
          "icon": Icons.share,
          "text": "Share",
        }
      ];

  Map<String, dynamic> shap() => {
        "type": "Rectangle",
        "border": {
          "color": "ff000000",
          "width": 0,
          "style": "none",
          "strokeCap": "butt",
          "strokeJoin": "miter"
        },
        "borderRadius": {
          "topLeft": {"x": "${Get.width}px", "y": "150px"},
          "topRight": {"x": "0px", "y": "0px"},
          "bottomLeft": {"x": "0px", "y": "0px"},
          "bottomRight": {"x": "0px", "y": "0px"}
        },
        "cornerStyles": {
          "topLeft": "straight",
          "bottomLeft": "rounded",
          "topRight": "rounded",
          "bottomRight": "rounded"
        }
      };
  Map   prefrence = {
    "Favorite Geners": [
      "Action",
      "Comedy",
      "Drama",
      "Horror",
      "Sci-Fi",
      "Romance",
      "Documentry",
      "Fantasy",
      "Thriller",
      "Anmation"
    ],
    "Preferred Languages": [
      "English",
      "Hindi",
      "Tamil",
      "Urdu",
      "Malyalam",
      "Kannada",
      "Arabic",
      "Spanish",
      "Bengali",
      "Marathi"
    ],
  };
}
