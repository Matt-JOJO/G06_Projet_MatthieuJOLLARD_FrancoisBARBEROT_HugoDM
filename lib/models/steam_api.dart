import 'dart:convert';


import 'game_card.dart';
import 'package:http/http.dart' as http;

class SteamAPI {
  /// function to call the steam api to get the list of most played games ///
  static Future<List<Game>> getMostPlayedGame() async {

    var response = await http.get(Uri.parse('https://api.steampowered.com/ISteamChartsService/GetMostPlayedGames/v1/?key=BD574C3057E0D74E889F344881A744D8'), headers: {
      });
    var data = jsonDecode(response.body)["response"]["ranks"];
    List temp = [];
    for(var i in data){
      temp.add(i);
    }
    return Game.gameFromSnap(temp);
  }
  static Future<List<Game>> fetchWishlist() async {

    var response =await http.get(Uri.https(
        'ya1m5c1c09.execute-api.eu-west-3.amazonaws.com', '/dev/likes'));
    var data = jsonDecode(response.body)["Items"]["appList"];
    List temp = [];
    for(var i in data){
      temp.add(i);
    }
    return Game.gameFromSnap(temp);
  }


  /// function to call the steam api to get the details of a game ///
  static Future<void> getGameDetails (Game game) async {

    var response2 = await http.get(Uri.parse("https://store.steampowered.com/api/appdetails?appids=${game.getAppid()}"),headers:  {
    });
print(response2.body);
    Map<String, dynamic> result = jsonDecode(response2.body)["${game.getAppid()}"];
    try {if (result["success"] != false){
      var img = jsonDecode(response2.body)["${game.getAppid()}"]["data"]["header_image"];
      var descriptionTxt = jsonDecode(response2.body)["${game.getAppid()}"]["data"]["short_description"];
      var descriptionLongTxt = jsonDecode(response2.body)["${game.getAppid()}"]["data"]["detailed_description"];
      var name = jsonDecode(response2.body)["${game.getAppid()}"]["data"]["name"];
      var free = jsonDecode(response2.body)["${game.getAppid()}"]["data"]["is_free"];
// rajouter un try et récupérer le champ avec le problème et voir si je peux quand même afficher les data ou sinon il aut l'ignorer
      String price = "";

      if (free == true){
        price = "free";
      } else {
        if (result["data"].containsKey('price_overview')){
          price = jsonDecode(response2.body)["${game.getAppid()}"]["data"]["price_overview"]["final_formatted"];
        } else if (result["data"]["package_groups"] != []){
          if (result["data"]["package_groups"][0].containsKey('subs')){
            Map<String, dynamic> result = jsonDecode(response2.body)["${game.getAppid()}"]["data"];
            price = (result["package_groups"][0]["subs"][0]["price_in_cents_with_discount"] / 100).toString();
          }else{
            price = "free";
          }
        }
      }
      //var editor = jsonDecode(response2.body)["${game.getAppid()}"]["data"]["publishers"];
      return  game.setDetails(img, descriptionTxt, name, price.toString(), price.toString(), descriptionLongTxt.toString());
    }
    }catch (e){
      print(e);
    }

  }

  /// function to get ratings ///
  static Future<void> getEachGameRatings(Game game) async {
    var response = await http.get(Uri.parse("https://store.steampowered.com/appreviews/${game.getAppid()}?&json=1"), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
      "Access-Control-Allow-Methods": "GET,PUT,PATCH,POST,DELETE"
    });
    Map<String, dynamic> result = jsonDecode(response.body);
    var reviews = result["reviews"];
    game.setRatings(reviews);
  }
  /// add function to get wishlist of user from dynamoDB ///

  static Future<void> getWishGameDetails (int appId, Game game) async {
print(appId);
    var response2 = await http.get(Uri.parse("https://store.steampowered.com/api/appdetails?appids=${int.parse(appId as String)}"),headers:  {
    });
    print(response2.body);
    Map<String, dynamic> result = jsonDecode(response2.body)["${int.parse(appId as String)}"];
    try {if (result["success"] != false){
      var img = jsonDecode(response2.body)["730"]["data"]["header_image"];
      var descriptionTxt = jsonDecode(response2.body)["${int.parse(appId as String)}"]["data"]["short_description"];
      var descriptionLongTxt = jsonDecode(response2.body)["${int.parse(appId as String)}"]["data"]["detailed_description"];
      var name = jsonDecode(response2.body)["${int.parse(appId as String)}"]["data"]["name"];
      var free = jsonDecode(response2.body)["${int.parse(appId as String)}"]["data"]["is_free"];
// rajouter un try et récupérer le champ avec le problème et voir si je peux quand même afficher les data ou sinon il aut l'ignorer
      String price = "";

      if (free == true){
        price = "free";
      } else {
        if (result["data"].containsKey('price_overview')){
          price = jsonDecode(response2.body)["${int.parse(appId as String)}"]["data"]["price_overview"]["final_formatted"];
        } else if (result["data"]["package_groups"] != []){
          if (result["data"]["package_groups"][0].containsKey('subs')){
            Map<String, dynamic> result = jsonDecode(response2.body)["${int.parse(appId as String)}"]["data"];
            price = (result["package_groups"][0]["subs"][0]["price_in_cents_with_discount"] / 100).toString();
          }else{
            price = "free";
          }
        }
      }
      //var editor = jsonDecode(response2.body)["${game.getAppid()}"]["data"]["publishers"];
      return  game.setDetails(img, descriptionTxt, name, price.toString(), price.toString(), descriptionLongTxt.toString());
    }
    }catch (e){
      print(e);
    }

  }

  Future <void> putWishlist(Game game, User userId) async {
    final put = await http.post(
        Uri.https(
            'ya1m5c1c09.execute-api.eu-west-3.amazonaws.com', '/dev/likes'),
        body: jsonEncode({
          "Item": {
            "id_user": {"S":' ${userId.toString}'},
            "appId" : {"N" : '$game'}
          },
          "TableName": "SteamAppLikes"
        }) );
    if (put.statusCode == 200) {
      print('Put wishlist call succeeded:${put.body}');
    } else {
      print('Put wishlist call failed:${put.statusCode}');
    }
  }
}

class User {
}
