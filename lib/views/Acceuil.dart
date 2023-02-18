import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Rechercher un jeu...',
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'GoogleSans',
                        color: Colors.white,
                      ),
                      hintText: 'Entre le nom du Speaker',
                      suffixIcon:IconButton(
                        icon: SvgPicture.asset(
                            'icones/whishlist.svg'),
                        color: Colors.deepPurpleAccent,
                        onPressed: () {
                          // do something
                        },
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                //color: const Color(0XFF2E2E2E),
                height: 250,
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
                      width:300,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:15, left:15, bottom:5),
                            child: Text(
                              "Titre du jeu".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                color: Colors.white,
                                fontFamily: "GoogleSans",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:15, bottom: 15),
                            child: Text(
                              "Edition du jeu".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
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
                                fontSize: 15,
                                letterSpacing: 1,
                                color: Colors.white,
                                fontFamily: "GoogleSans",
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:18, left:15, bottom:15),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                fixedSize: const Size(150, 30),
                                primary:  Colors.white,
                                backgroundColor: Colors.blueAccent,
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
                        width:220,
                        child:Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:[
                              Padding(
                                padding: const EdgeInsets.only(right:15, bottom:15),
                                child: Image.asset(
                                  'images/ps4.jpg',
                                  width: 120,
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
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:const [
                    Padding(
                      padding: EdgeInsets.all(15),
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
              Container(
                color: const Color(0XFF2E2E2E),
                margin: const EdgeInsets.only(top:15, left:15, bottom:5, right: 15),
                height: 150,
                /*decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage('images/back_PS4.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.modulate)
                  )
              ),*/
                child: Row(
                  children: [
                    SizedBox(
                        child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Padding(
                                padding: const EdgeInsets.only(left:15, bottom:15, top: 15),
                                child: Image.asset(
                                  'images/ps4.jpg',
                                  height: 120,
                                ),
                              ),
                            ]
                        )
                    ),
                    SizedBox(
                      width:200,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left:15, bottom:5),
                            child: Text(
                              "Nom du jeu",
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                color: Colors.white,
                                fontFamily: "GoogleSans",
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:15, bottom: 15),
                            child: Text(
                              "Nom de l'éditeur",
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 1,
                                color: Colors.white,
                                fontFamily: "GoogleSans",
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:15),
                            child: Text(
                              "Prix: 10,00€",
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 1,
                                color: Colors.white,
                                fontFamily: "GoogleSans",
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        child:Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:[
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                    ),
                                    fixedSize: const Size(100, 150),
                                    primary:  Colors.white,
                                    backgroundColor: Colors.blueAccent,
                                  ),
                                  onPressed: (){
                                    //print('Pressed');
                                  },
                                  child: const Text('En savoir plus',
                                      textAlign: TextAlign.center),
                                ),
                              )
                            ]
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}