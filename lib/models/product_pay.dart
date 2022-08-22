import 'package:globaltrailblazersapp/models/product.dart';
import 'package:latlong2/latlong.dart';

enum PurchaseType { delivery, print }

class ProductPay {
  int priceToBePaid, quantity;
  Product product;
  String? cellPhone;
  LatLng? location;
  PurchaseType purchaseType;

  ProductPay(
      {required this.product,
      required this.priceToBePaid,
      required this.purchaseType,
      required this.quantity,
      required this.cellPhone,
      required this.location});
}
