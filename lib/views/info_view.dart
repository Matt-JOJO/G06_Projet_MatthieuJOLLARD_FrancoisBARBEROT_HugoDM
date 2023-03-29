import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/game_card.dart';
import 'Acceuil.dart';
import 'likes_view.dart';
import 'Wishlist.dart';

class InfoView extends StatelessWidget {
  final Game item;

  late bool _onDescritpion = true;
  late bool _onComment = false;
late bool state = false;
  InfoView({
    Key? key,
    required this.item,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A2025),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2025),
        title: const Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Text(
            'Détail du jeu',
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Wishlist()),
              );
            },
          ),
          IconButton(
            icon: SvgPicture.asset('icones/whishlist.svg'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EmptyLikes()),
              );
            },
          ),
        ],
        centerTitle: false,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(

              children: [
                _image(),
              ],
            ),
            _doubleButton(),
            SizedBox(
              height: 20,
            ),
            _Paragraphe(state),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return Image.network(
      item.image,
      height: 200,
      width: 400,
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: 175,
        decoration: const BoxDecoration(color: Color(0xFF2A323A)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleText(),
            const SizedBox(height: 1),
            _editorText(),
          ],
        ),
      ),
    );
  }

  Widget _titleText() {
    return Text(
      item.name,
      style: const TextStyle(
        fontSize: 16,
        letterSpacing: 1,
        color: Colors.white,
        fontFamily: "GoogleSans",
      ),
    );
  }

  Widget _editorText() {
    return Text(
      item.editorName,
      style: const TextStyle(
        fontSize: 12,
        letterSpacing: 1,
        color: Colors.white,
        fontFamily: "GoogleSans",
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _doubleButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(

        children: <Widget>[
          Expanded(child: _DescriptionButton()),
          Expanded(child: _CommentButton()),

        ],
      ),
    );
  }

  Widget _DescriptionButton() {
    return InkWell(
      onTap: () {
        state = true;
        _onDescritpion = true;
        print("on descritption : $_onDescritpion");
        _onComment = false;
        print("on comment : $_onComment");
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: _onDescritpion
            ? BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(5),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
        child: const Center(
          child: Text(
            "Description",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'GoogleSans',
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }

  Widget _CommentButton() {
    return InkWell(
      onTap: () {
        state = false;
        _onDescritpion = false;
        print("on descritption : $_onDescritpion");
        _onComment = true;
        print("on comment : $_onComment");
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: _onComment
            ? BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(5),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
        child: const Center(
          child: Text(
            "Avis",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'GoogleSans',
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }

  Widget _Paragraphe(state) {
    return state
        ? ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: item.ratings.length,
        itemBuilder: (context, index) {
          return Text(
            item.ratings.elementAt(index)["review"],
            style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontFamily: 'GoogleSans',
                fontWeight: FontWeight.normal),
          );
        })
        :  Text(
      item.descriptionLongTxt,
      style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontFamily: 'GoogleSans',
          fontWeight: FontWeight.normal),
    );
  }
}
