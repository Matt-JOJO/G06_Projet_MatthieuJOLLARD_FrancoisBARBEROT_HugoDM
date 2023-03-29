
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// functionnality of the search bar are not implemented
class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1A2025),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A2025),
          title: const Padding(
            padding: EdgeInsets.only(left:0.0),
            child: Text('Rechercher',
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
            onPressed: () {},
          ),
          centerTitle: false,

        ),

        body: Align(
          child: Column(
            children: [
              const SizedBox(
                height: 7,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:12, top:12, right: 12),
                      child: Text(
                        "Nombre de résultats : ",
                        style: const TextStyle(
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
              const SizedBox(
                height: 2,
              ),

            ],
          ),
        )
    );
  }
}