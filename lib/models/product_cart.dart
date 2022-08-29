import 'package:globaltrailblazersapp/models/product.dart';

class ProductCart {
  int id;
  int productId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;
  ProductCart(
      {required this.id,
      required this.productId,
      required this.userId,
      required this.product,
      required this.createdAt,
      required this.updatedAt});

  static ProductCart fromJson(Map<String, dynamic> json) => ProductCart(
        id: json["id"],
        productId: json["productId"],
        userId: json["userId"],
        product: Product.fromJson(json["product"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
