import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Acceuil.dart';

  class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF1A2025),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A2025),
        title: Padding(
          padding: const EdgeInsets.only(left:0.0),
          child: Text('Mes likes',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: "GoogleSans",
            ),
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            'icones/close.svg',
            width: 20,
          ),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => const  Acceuil()), );
          },
        ),
        centerTitle: false,

      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'icones/empty_whishlist.svg',
                  width: 50,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(6.0),
              child: Text(
                "Vous n'avez pas encore liké de contenu.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                  color: Colors.white,
                  fontFamily: "GoogleSans",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: Text(
                "Cliquez sur l'étoile pour en rajouter.",
                textAlign: TextAlign.center,style: TextStyle(
                fontSize: 18,
                letterSpacing: 1,
                color: Colors.white,
                fontFamily: "GoogleSans",
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}