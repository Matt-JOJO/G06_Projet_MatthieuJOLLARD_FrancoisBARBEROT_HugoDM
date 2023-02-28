import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mysteamapp/API/Data.dart';

class FetchFamousGameList {

  Future<List<GameRank>> getFamousGames() async {
    const url = 'https://api.steampowered.com/ISteamChartsService/GetMostPlayedGames/v1/';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      var jsonGames = jsonResponse['ranks'];

      List<GameRank> games = [];
      for (var jsonGame in jsonGames) {
        GameRank gameList = GameRank.fromJson(jsonGame);
        games.add(gameList);
      }

      return games;
    } else {
      return <GameRank>[];
    }
  }
}