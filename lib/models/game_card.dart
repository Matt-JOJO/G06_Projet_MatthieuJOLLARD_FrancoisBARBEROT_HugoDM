import 'package:flutter/material.dart';
import 'package:mysteamapp/models/movieCardModel.dart';
import 'package:mysteamapp/views/info_view.dart';

class Game {
  late final int rank;
  late final int appid;
  late String image = "no image from steam";
  late String name = "no name from steam";
  late String descriptionTxt = "no description from steam";
  late String descriptionLongTxt = "no description from steam";
  late String editorName = "no editor name from steam";
  late String price = "no price from steam";
  List ratings = [];

  Game({
    required this.rank,
    required this.appid,
  });

  factory Game.fromJson(dynamic json) {
    return Game(
      rank: json['rank'] as int,
      appid: json['appid'] as int,
    );
  }

  displayGameInfo() {
    print("The game is : $name of id $appid, cost is $price with rank : $rank , link is : $image, description is : $descriptionTxt\n");
  }
  getAppid(){
    return appid;
  }
  setDetails(String url, String text, String gameName, String editor, gamePrice, String longText){
    descriptionTxt = text;
    image = url;
    name = gameName;
    editorName = editor;
    price = gamePrice;
    descriptionLongTxt = longText;
  }

  setRatings(List gameRatings){
    for (var i in gameRatings){
      if (i["review"].toString().length > 130){
        i["review"] =  "${i["review"].toString().substring(0,130)}...";
      }
      i["review"] = i["review"].replaceAll("\n", " ");
      i["review"] = i["review"].replaceAll("-", "");
      if (double.parse(i["weighted_vote_score"]) > 0.5 && double.parse(i["weighted_vote_score"]) < 0.7){
        i["weighted_vote_score"] = 3;
      }else if (double.parse(i["weighted_vote_score"]) > 0.7 && double.parse(i["weighted_vote_score"]) < 0.8){
        i["weighted_vote_score"] = 4;
      }else if (double.parse(i["weighted_vote_score"]) > 0.8){
        i["weighted_vote_score"] = 5;
      }

    }
    ratings = gameRatings;
  }
  static List<Game> gameFromSnap(List snapshot) {
    return snapshot.map((data) {
      return Game.fromJson(data);
    }).toList();
  }

 /* @override
  String toString(){
    return 'The game is : $name of id $appid, cost is $price with rank : $rank , link is : $image, description is : $descriptionTxt\n';
  }*/
}


class ItemWidget extends StatelessWidget {
  final Game item;
  final usage;

  const ItemWidget({Key? key, required this.item,required this.usage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return usage ?
      mainCard(context) :
    Container(
      //constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
      decoration: const BoxDecoration(
          color: Color(0xFF1E262C),
          borderRadius: BorderRadius.all(Radius.circular(5.0)
          )
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left:12, top: 12, right: 12),
      padding: const EdgeInsets.only(left:12),
      child: Expanded(
        child: Row(
          children: [
            Image.network(
              item.image,
              height: 90,
            ),
            const SizedBox(width:12),
            SizedBox(
              width: 139,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Colors.white,
                      fontFamily: "GoogleSans",
                    ),
                  ),
                  const SizedBox(height:1),
                  Text(
                    item.editorName,
                    style: const TextStyle(
                      fontSize: 12,
                      letterSpacing: 1,
                      color: Colors.white,
                      fontFamily: "GoogleSans",
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height:10),
                  Text(
                    "Prix: ${item.price}",
                    style: const TextStyle(
                      fontSize: 12,
                      letterSpacing: 1,
                      color: Colors.white,
                      fontFamily: "GoogleSans",
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 20,
                      ),
                      foregroundColor:  Colors.white,
                      backgroundColor: const Color(0xFF636AF6),
                    ),
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => InfoView(item: item)), );
                    },
                    child: const Text('En savoir plus',
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

    );

  }

  Widget mainCard( context){
return Stack(
  children: [
    Image.network(
      item.image,
      height: 200,
      width: 385,
    ),
    const SizedBox(width:12),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
    child:  SizedBox(

      width: 175,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            item.name,
            style: const TextStyle(
              fontSize: 16,
              letterSpacing: 1,
              color: Colors.white,
              fontFamily: "GoogleSans",
            ),
          ),
          const SizedBox(height:1),
          Text(
            item.editorName,
            style: const TextStyle(
              fontSize: 12,
              letterSpacing: 1,
              color: Colors.white,
              fontFamily: "GoogleSans",
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height:10),
          Text(
            "Prix: ${item.price}",
            style: const TextStyle(
              fontSize: 12,
              letterSpacing: 1,
              color: Colors.white,
              fontFamily: "GoogleSans",
              fontWeight: FontWeight.normal,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 20,
              ),
              foregroundColor:  Colors.white,
              backgroundColor: const Color(0xFF636AF6),
            ),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => InfoView(item: item)), );
            },
            child: const Text('En savoir plus',
                textAlign: TextAlign.center),
          ),
        ],
      ),
    ),
    )

  ],
);
  }
}
