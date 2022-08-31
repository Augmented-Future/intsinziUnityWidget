import 'package:globaltrailblazersapp/models/product.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum PurchaseType { delivery, print }

class ProductPay {
  int priceToBePaid, quantity;
  List<Product> products;
  String? cellPhone;
  DeliverLocation? location;
  PurchaseType purchaseType;

  ProductPay(
      {required this.products,
      required this.priceToBePaid,
      required this.purchaseType,
      required this.quantity,
      required this.cellPhone,
      required this.location});
}

class DeliverLocation {
  LatLng position;
  String street;
  String name;
  String subAdministrativeArea;
  String adminiStrativeArea;
  String locality;
  String country;
  String isoCountryCode;
  DeliverLocation(
      {required this.position,
      required this.adminiStrativeArea,
      required this.country,
      required this.isoCountryCode,
      required this.locality,
      required this.name,
      required this.street,
      required this.subAdministrativeArea});
}
