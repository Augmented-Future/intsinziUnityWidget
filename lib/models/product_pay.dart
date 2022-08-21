import 'package:globaltrailblazersapp/models/product.dart';

enum PurchaseType { delivery, print }

class ProductPay {
  int priceToBePaid, quantity;
  Product product;
  String? cellPhone, location;
  PurchaseType purchaseType;

  ProductPay(
      {required this.product,
      required this.priceToBePaid,
      required this.purchaseType,
      required this.quantity,
      required this.cellPhone,
      required this.location});
}
