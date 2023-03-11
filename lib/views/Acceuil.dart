import 'package:mysteamapp/models/movieCardModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mysteamapp/models/game_card.dart';
import 'package:mysteamapp/models/steam_api.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  late List<Game> _games;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getGames();
  }

  Future<void> getGames() async {
    setState(() {
    _isLoading = false;
  });
    _games = await SteamAPI.getMostPlayedGame();
    for (var i in _games) {
      await SteamAPI.getGameDetails(i);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1A2025),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A2025),
          title: const Padding(
            padding: EdgeInsets.only(left: 0.0),
            child: Text(
              'Acceuil',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: "GoogleSans",
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset('icones/whishlist.svg'),
              onPressed: () {
                // do something
              },
            ),
          ],
          centerTitle: false,
        ),
        body: Align(
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  color: const Color(0xFF1E262C),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Rechercher un jeu...',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'GoogleSans',
                        color: Colors.white,
                      ),
                      hintText: 'Entre le nom du Speaker',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF636AF6),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                //color: const Color(0XFF2E2E2E),
                height: 300,
                width: 400,
                decoration: BoxDecoration(),
                child: Row(
                  children: [
                    SizedBox(
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(5.0),
                            height: 300,
                            width: 400,
                            child: _isLoading
                                ?  Center(child: CircularProgressIndicator())
                                :  ItemWidget(item: _games[0]),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                        width: 120,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 15, bottom: 15),
                              ),
                            ]))
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                /*Padding(
                  padding: EdgeInsets.only(left: 12, top: 12, right: 12),
                  child: Text(
                    "Les meilleures ventes",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                      color: Colors.white,
                      fontFamily: "GoogleSans",
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),*/
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      height: 300,
                      width: 400,
                      child: _isLoading
                        ?  Center(child: CircularProgressIndicator())
                      :  ListView.builder( scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: _games.length,itemBuilder : (context, index){
                      return ItemWidget(item: _games[index]);
                    }),
                    )
              ]),
            ],
          ),
        ));
  }
}
