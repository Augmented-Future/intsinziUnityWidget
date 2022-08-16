import 'package:globaltrailblazersapp/models/filter_category.dart';

class Product {
  int id;
  String name, description, imgUrl;
  double price;
  ProductType type;
  DateTime createAt;
  DateTime updatedAt;
  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.imgUrl,
      required this.price,required this.type,
      required this.createAt,
      required this.updatedAt});
}

List<Product> productsList = [
  Product(
      id: 1,
      name: "Book",
      description:
          "Lorem ipsum dolor text should decribe whatever comes here. ",
      imgUrl: "https://thumbs.dreamstime.com/b/print-146985740.jpg",
      price: 500.0,
      type: ProductType(id: 1, name: "Printable"),
      createAt: DateTime.now(),
      updatedAt: DateTime.now()),
  Product(
      id: 2,
      name: "Board Game",
      description:
          "Lorem ipsum dolor text should decribe whatever comes here. ",
      imgUrl: "https://thumbs.dreamstime.com/b/print-146985740.jpg",
      price: 500.0,
      type: ProductType(id: 1, name: "Printable"),
      createAt: DateTime.now(),
      updatedAt: DateTime.now()),
  Product(
      id: 3,
      name: "Live Matter",
      description:
          "Lorem ipsum dolor text should decribe whatever comes here. ",
      imgUrl: "https://thumbs.dreamstime.com/b/print-146985740.jpg",
      price: 500.0,
      type: ProductType(id: 1, name: "Printable"),
      createAt: DateTime.now(),
      updatedAt: DateTime.now()),
];
