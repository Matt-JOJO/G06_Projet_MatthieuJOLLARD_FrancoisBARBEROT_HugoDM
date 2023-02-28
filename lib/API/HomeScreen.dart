import 'package:flutter/material.dart';
import 'package:mysteamapp/API/Api_services.dart';
import 'package:mysteamapp/API/Data.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FetchFamousGameList _gameList = FetchFamousGameList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GameList'),
          actions: [
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.search_sharp),
            )
          ],
        ),
        body: FutureBuilder<List<GameRank>>(
              future: _gameList.getFamousGames(),
              builder: (context, snapshot) {
                var data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Container(
                        //constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
                        decoration: const BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.all(Radius.circular(5.0)
                            )
                        ),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left:15, top: 15, right: 15),
                        padding: const EdgeInsets.only(left:15),
                        child: Row(
                          children: [
                            Image.asset(
                              'images/ps4.jpg',
                              width: 90,
                            ),
                            const SizedBox(width:20),
                            SizedBox(
                              width: 250,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '${data?[index].rank}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          letterSpacing: 1,
                                          color: Colors.black,
                                          fontFamily: "GoogleSans",
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                          '${data?[index].appid}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            letterSpacing: 1,
                                            color: Colors.black,
                                            fontFamily: "GoogleSans",
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                    ),
                                    Text(
                                        "Prix: ${data?[index].peak_in_game},00€",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1,
                                          color: Colors.black,
                                          fontFamily: "GoogleSans",
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                  ],
                                ),
                            ),
                            Container(
                                width: 118,
                                height: 150,
                                child:(
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle: const TextStyle(
                                            fontSize: 20,
                                          ),
                                          foregroundColor:  Colors.white,
                                          backgroundColor: Colors.blueAccent,
                                        ),
                                        onPressed: (){
                                          //print('Pressed');
                                        },
                                        child: const Text('En savoir plus',
                                            textAlign: TextAlign.center),
                                      )
                                )
                            ),
                          ],
                        ),
                      );
                    });
              }),
        ),
      );
  }
}