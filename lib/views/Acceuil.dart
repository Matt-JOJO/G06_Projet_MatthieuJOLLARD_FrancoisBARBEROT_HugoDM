import 'package:mysteamapp/models/movieCardModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mysteamapp/views/widgets/game_card.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1A2025),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A2025),
          title: const Padding(
            padding: EdgeInsets.only(left:0.0),
            child: Text('Acceuil',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: "GoogleSans",
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                  'icones/like.svg'),
              onPressed: () {
                // do something
              },
            ),
            IconButton(
              icon: SvgPicture.asset(
                  'icones/whishlist.svg'),
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
                      suffixIcon:Icon( Icons.search,
                        color: Color(0xFF636AF6),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                //color: const Color(0XFF2E2E2E),
                height: 200,
                width: 550,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: const AssetImage('images/back_PS4.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.modulate)
                    )
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width:270,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top:15, left:15),
                            child: Text(
                              "Titre du jeu",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontFamily: "GoogleSans",
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left:15, bottom: 10),
                            child: Text(
                              "Edition du jeu",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontFamily: "GoogleSans",
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left:15),
                            child: Text(
                              "Une description du jeu mise en avant",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontFamily: "GoogleSans",
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:10, left:15, bottom:5),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                fixedSize: const Size(150, 30),
                                foregroundColor:  Colors.white,
                                backgroundColor: const Color(0xFF636AF6),
                              ),
                              onPressed: (){
                                //print('Pressed');
                              },
                              child: const Text('En savoir plus'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width:120,
                        child:Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:[
                              Padding(
                                padding: const EdgeInsets.only(right:15, bottom:15),
                                child: Image.asset(
                                  'images/ps4.jpg',
                                ),
                              ),
                            ]
                        )
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:const [
                    Padding(
                      padding: EdgeInsets.only(left:12, top:12, right: 12),
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
                    ),
                  ]
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: CatalogModel.items.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      item: CatalogModel.items[index],
                    );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}