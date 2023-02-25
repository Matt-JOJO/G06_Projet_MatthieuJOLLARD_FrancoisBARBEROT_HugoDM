import 'package:flutter/material.dart';
import 'package:mysteamapp/models/movieCardModel.dart';

class ItemWidget extends StatelessWidget {
  final Game item;

  const ItemWidget({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
      decoration: const BoxDecoration(
          color: Color(0xFF1E262C),
          borderRadius: BorderRadius.all(Radius.circular(5.0)
          )
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left:12, top: 12, right: 12),
      padding: const EdgeInsets.only(left:12),
      child: Row(
        children: [
          Image.asset(
            item.image,
            height: 80,
          ),
          const SizedBox(width:12),
          SizedBox(
            width: 175,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                    color: Colors.white,
                    fontFamily: "GoogleSans",
                  ),
                ),
                const SizedBox(height:1),
                Text(
                  item.editor,
                  style: const TextStyle(
                    fontSize: 12,
                    letterSpacing: 1,
                    color: Colors.white,
                    fontFamily: "GoogleSans",
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height:10),
                Text(
                  "Prix: ${item.price},00€",
                  style: const TextStyle(
                    fontSize: 12,
                    letterSpacing: 1,
                    color: Colors.white,
                    fontFamily: "GoogleSans",
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              width: 110,
              height: 100,
              child:(
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 20,
                      ),
                      foregroundColor:  Colors.white,
                      backgroundColor: const Color(0xFF636AF6),
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
  }
}