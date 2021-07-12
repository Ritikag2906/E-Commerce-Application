class CatalogModel {
  static final items = [
    Item(
      id: 001,
      name: "iPhone 12",
      desc: "Apple iPhone 12th generation",
      price: 999,
      color: "#33505a",
      image:
          "https://images-na.ssl-images-amazon.com/images/I/71hIfcIPyxS._SX466_.jpg",
    )
  ];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
}
