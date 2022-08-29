import 'package:globaltrailblazersapp/shared/url.dart';
import 'package:globaltrailblazersapp/models/product_pay.dart';
import 'package:globaltrailblazersapp/models/user.dart';

class PaymentService {
  final Uri _momoUri = Uri.parse(databaseUrl + "/payments/momo");
  final Uri _cardUri = Uri.parse(databaseUrl + "/payments/card");

  ProductPay productPay;
  UserAccount user;
  PaymentService({required this.productPay, required this.user});

  static Future payWithMomo(int mobileNumber, String momoName) async {}
  static Future payWithCard(int cardNumber, String nameOnCard, int cvv,
      int expMonth, int expYear) async {}
}
