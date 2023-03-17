import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:mysteamapp/models/movieCardModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mysteamapp/models/game_card.dart';
import 'package:mysteamapp/models/steam_api.dart';
import 'package:mysteamapp/views/EmptyLikes.dart';
import 'package:mysteamapp/views/Wishlist.dart';
import 'package:mysteamapp/views/widgets/signOut.dart';



class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  late List<Game> _games;
  late Iterable<Game> _gamesLimit;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getGames();
  }

  Future<void> getGames() async {

    _games = await SteamAPI.getMostPlayedGame();
    _gamesLimit = _games.take(45);
    for (var i in _gamesLimit) {
      await SteamAPI.getGameDetails(i);
    }

    setState(() {
      _isLoading = false;
    });
  }
 /* Future<void> fetchData()  async {

    try {
      const options = RestOptions(path: "/items", apiName: "testApiSteam" );
      final restOperation = Amplify.API.get(restOptions: options, );
      final response = await restOperation.response;
      print('GET call succeeded: ${response.body}');
    } on ApiException catch (e) {
      print('GET call failed: $e');
    }
  }*/

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
              icon: SvgPicture.asset('icones/like.svg'),
              onPressed: () {
               Navigator.push(context,MaterialPageRoute(builder: (context) => const Wishlist()), );
              },
            ),
            IconButton(
              icon: SvgPicture.asset('icones/whishlist.svg'),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const EmptyLikes()), );
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
                      hintText: 'Entrez un nom',
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
                decoration: BoxDecoration(),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          height: 180,
                          width: 380,
                          child: _isLoading
                              ? Center(child: CircularProgressIndicator())
                              : ItemWidget(item: _gamesLimit.elementAt(0), usage: true,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: 22,
                    child:Text(
                      "Les meilleures ventes",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                        color: Colors.white,
                        fontFamily: "GoogleSans",
                        decoration: TextDecoration.underline,
                      ),
                    ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 350,
                  width: 380,
                  child: _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: _gamesLimit.length,
                          itemBuilder: (context, index) {
                            return ItemWidget(item: _gamesLimit.elementAt(index), usage: false,);
                          }),
                )
              ]),
            ],
          ),
        ));
  }
}
