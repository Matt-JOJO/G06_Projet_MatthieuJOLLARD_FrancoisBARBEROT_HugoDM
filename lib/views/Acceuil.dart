import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Acceuil extends StatelessWidget {
  const Acceuil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF1A2025),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A2025),
        title: Padding(
          padding: const EdgeInsets.only(left:0.0),
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
        alignment: Alignment.center,
        child: Column(
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