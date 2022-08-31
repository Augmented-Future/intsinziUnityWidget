import 'dart:convert';

import 'package:globaltrailblazersapp/shared/url.dart';
import 'package:globaltrailblazersapp/models/product_pay.dart';
import 'package:globaltrailblazersapp/models/user.dart';
import 'package:http/http.dart' as http;

import '../shared/funcs.dart';
import '../shared/keys.dart';

class PaymentService {
  static Uri momoUri = Uri.parse(databaseUrl + "/payments/momo");
  static Uri cardUri = Uri.parse(databaseUrl + "/payments/card");

  ProductPay productPay;
  UserAccount user;
  PaymentService({required this.productPay, required this.user});

  Future payWithMomo(String mobileNumber, String momoName) async {
    try {
      final response = await http.post(
        momoUri,
        headers: {
          'Authorization': 'Bearer $userAdminToken',
        },
        body: {
          "amount": productPay.priceToBePaid.toString(),
          "phone_number": mobileNumber,
          "product_id": productPay.products[0].id.toString(),
        },
      );
      final decoded = jsonDecode(response.body);
      if (response.statusCode != 200) {
        return errorMethod(response.statusCode, decoded["message"]);
      }
      return {
        "success": true,
        "message": decoded["message"],
        "statusCode": response.statusCode
      };
    } catch (e) {
      return errorMethod(500, "Something went wrong, $e");
    }
  }

  Future payWithCard(String cardNumber, String nameOnCard, String cvv,
      String expMonth, String expYear) async {
    try {
      final response = await http.post(
        cardUri,
        headers: {
          'Authorization': 'Bearer $userAdminToken',
        },
        body: {
          "card_number": cardNumber.replaceAll(' ', ''),
          "cvv": cvv,
          "expiry_month": expMonth,
          "expiry_year": expYear,
          "currency": "RWF",
          "amount": productPay.priceToBePaid.toString(),
          "product_id": productPay.products[0].id.toString()
        },
      );
      final decoded = jsonDecode(response.body);
      if (response.statusCode != 200) {
        return errorMethod(response.statusCode, decoded["message"]);
      }
      return {
        "success": true,
        "message": decoded["message"],
        "statusCode": response.statusCode
      };
    } catch (e) {
      return errorMethod(500, "Something went wrong, $e");
    }
  }
}
