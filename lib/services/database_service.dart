import 'dart:convert';
import 'dart:io';

import 'package:globaltrailblazersapp/models/game_model.dart';
import 'package:globaltrailblazersapp/shared/keys.dart';
import 'package:globaltrailblazersapp/shared/url.dart';
import 'package:globaltrailblazersapp/models/animation_content_model.dart';
import 'package:globaltrailblazersapp/models/avatar.dart';
import 'package:globaltrailblazersapp/models/book_model.dart';
import 'package:globaltrailblazersapp/models/grade_model.dart';
import 'package:globaltrailblazersapp/models/product_model.dart';
import 'package:globaltrailblazersapp/models/product_cart.dart';
import 'package:http/http.dart' as http;

import '../shared/funcs.dart';

class DatabaseService {
  static var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $userAdminToken',
  };
  //Creating GET request
  static Future<RequestResponse> createGetRequest(String apiRoute) async {
    try {
      Uri url = Uri.parse(databaseUrl + apiRoute);
      final response = await http.get(url, headers: headers);

      final decoded = jsonDecode(response.body);
      return RequestResponse(decoded: decoded, statusCode: response.statusCode);
    } catch (e) {
      return RequestResponse(decoded: null, statusCode: 500);
    }
  }

  //Getting animations from Database
  static Future fetchAnimations({required int gradeId}) async {
    try {
      Uri url = Uri.parse(databaseUrl + '/animations');
      final response = await http.get(url);
      final decoded = jsonDecode(response.body);

      if (response.statusCode != 200) {
        return errorMethod(response.statusCode, decoded['message']);
      }

      List<AnimationsContent> animations = [];
      for (var animation in decoded['data']['rows']) {
        animations.add(AnimationsContent.fromJson(animation));
      }
      return animations
          .where((animation) => animation.gradeId == gradeId)
          .toList();
    } on SocketException catch (_) {
      return errorMethod(503, "No Internet");
    } catch (e) {
      return errorMethod(500, "Something went wrong, $e");
    }
  }

  //Getting Avatars from database
  static Future fetchAvatars() async {
    try {
      Uri url = Uri.parse(databaseUrl + '/avatars');
      final response = await http.get(url);
      final decoded = jsonDecode(response.body);

      if (response.statusCode != 200) {
        return errorMethod(response.statusCode, decoded['message']);
      }
      List<Avatar> avatars = [];
      for (var i = 0; i < decoded['data'].length; i++) {
        avatars.add(Avatar.fromJson(decoded['data'][i]));
      }
      return avatars;
    } catch (e) {
      return errorMethod(500, "Something went wrong, $e");
    }
  }

  static Future fetchAllGrades() async {
    try {
      Uri url = Uri.parse(databaseUrl + '/grades');
      final response = await http.get(url);
      final decoded = jsonDecode(response.body);
      List<Grade> grades = [];
      for (var i = 0; i < decoded['data']['rows'].length; i++) {
        grades.add(Grade.fromJson(decoded['data']['rows'][i]));
      }
      return grades;
    } catch (e) {
      return errorMethod(500, "Something went wrong, $e");
    }
  }

  static Future fetchOneGrade(int gradeId) async {
    try {
      Uri url = Uri.parse(databaseUrl + '/grades/' + gradeId.toString());
      final response = await http.get(url);
      final decoded = jsonDecode(response.body);
      return Grade.fromJson(decoded['data']);
    } catch (e) {
      return null;
    }
  }

  static Future fetchAllBooks() async {
    try {
      Uri url = Uri.parse(databaseUrl + '/books');
      final response = await http.get(url);
      final decoded = jsonDecode(response.body);

      if (response.statusCode != 200) {
        return errorMethod(response.statusCode, decoded['message']);
      }
      List<Book> books = [];
      for (var book in decoded['data']['rows']) {
        books.add(Book.fromJson(book));
      }
      if (books.isEmpty) {
        return ErrorException(
          statusCode: 204,
          error: "No Content",
          errorMessage: "No book found for the selected course or grade",
        );
      }
      return books;
    } on SocketException catch (_) {
      return ErrorException(
          statusCode: 504,
          error: "No Internet",
          errorMessage:
              "Poor connection is detected, try again when your connection is back");
    } catch (e) {
      return errorMethod(500, "Something went wrong, $e");
    }
  }

  static Future fetchAllProducts() async {
    try {
      Uri url = Uri.parse(databaseUrl + '/products');
      final response = await http.get(url);
      final decoded = jsonDecode(response.body);

      if (response.statusCode != 200) {
        return errorMethod(response.statusCode, decoded['message']);
      }
      List<Product> products = [];
      for (var product in decoded['data']) {
        products.add(Product.fromJson(product));
      }
      return products;
    } catch (e) {
      return errorMethod(500, "Something went wrong, $e");
    }
  }

  //Getting all products from cart in DB
  static Future fetchAllCarts() async {
    try {
      RequestResponse result = await createGetRequest('/carts');
      if (result.decoded == null) throw "[GET] Request failed. /carts";
      if (result.statusCode != 200) {
        return errorMethod(result.statusCode, result.decoded['message']);
      }

      List<ProductCart> productCarts = [];
      for (var i = 0; i < result.decoded['data'].length; i++) {
        productCarts.add(ProductCart.fromJson(result.decoded['data'][i]));
      }

      return productCarts;
    } catch (e) {
      return errorMethod(500, "Something went wrong, $e");
    }
  }

  static Future removeFromCart(int cartId) async {
    try {
      Uri url = Uri.parse(databaseUrl + '/carts/' + cartId.toString());
      final response = await http.delete(url, headers: headers);
      final decoded = jsonDecode(response.body);
      if (response.statusCode != 200) {
        return errorMethod(response.statusCode, decoded["message"]);
      }
      return true;
    } catch (e) {
      return errorMethod(500, "Something went wrong, $e");
    }
  }

  static Future addToCart(int productId) async {
    try {
      Uri url = Uri.parse(databaseUrl + '/carts');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $userAdminToken',
        },
        body: {"productId": productId.toString()},
      );
      final decoded = jsonDecode(response.body);
      if (response.statusCode != 201) {
        return errorMethod(response.statusCode, decoded["message"]);
      }
      return true;
    } catch (e) {
      return errorMethod(500, "Something went wrong, $e");
    }
  }

  //Getting all games
  static Future fetchGames({required int gradeId}) async {
    try {
      Uri url = Uri.parse(databaseUrl + '/games');
      final response = await http.get(url);
      final decoded = jsonDecode(response.body);

      if (response.statusCode != 200) {
        return errorMethod(response.statusCode, decoded['message']);
      }

      List<Game> games = [];
      for (var game in decoded['data']['rows']) {
        games.add(Game.fromJson(game));
      }
      return games.where((game) => int.parse(game.gradeId) == gradeId).toList();
    } on SocketException catch (_) {
      return ErrorException(
        statusCode: 503,
        error: "No Internet",
        errorMessage: "Please try again when your connection is back.",
      );
    } catch (e) {
      return errorMethod(500, "Something went wrong, $e");
    }
  }
}

class RequestResponse {
  int statusCode;
  dynamic decoded;
  RequestResponse({required this.decoded, required this.statusCode});
}
