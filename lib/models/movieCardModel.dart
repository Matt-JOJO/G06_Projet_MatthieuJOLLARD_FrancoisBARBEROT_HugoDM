class CatalogModel {
  static final items = [
    Game(
        id: 1,
        title: "Assassins Creed",
        editor: "IDK",
        price: 10,
        image:'images/ps4.jpg'
    ),
    Game(
        id: 2,
        title: "Assassins Creed",
        editor: "IDK",
        price: 10,
        image:'images/ps4.jpg'
        )
  ];
}

class Game {
  final int id;
  final String title;
  final String editor;
  final num price;
  final String image;

  Game({required this.id,required this.title, required this.editor, required this.price, required this.image});
}