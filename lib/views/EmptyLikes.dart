import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyLikes extends StatelessWidget {
  const EmptyLikes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF1A2025),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A2025),
        leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'icones/close.svg',
              width: 20,
            ),
          ),
        title: Text('Mes likes',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: "GoogleSans",
          ),
        ),
        centerTitle: false,

      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                icon: SvgPicture.asset(
                  'icones/empty_likes.svg',
                  width: 100,
                ),
                onPressed: () {},
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
                "Cliquez sur le coeur pour en rajouter.",
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