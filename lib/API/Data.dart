class GameRank {
  int? rank;
  int? appid;
  int? peak_in_game;

  GameRank(
      {required this.rank,
        required this.appid,
        required this.peak_in_game,
      }
      );

  GameRank.fromJson(Map<String, dynamic> map) {
    rank: map['rank'];
    appid: map['appid'];
    peak_in_game: map['peak_in_game'];
  }
}