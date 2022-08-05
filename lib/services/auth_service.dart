import 'dart:convert';

import 'package:get/get.dart';
import 'package:globaltrailblazersapp/constants/url.dart';
import 'package:globaltrailblazersapp/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

enum IsSubmitting { submitting, error, failed, done }

class AuthService extends GetxController {
  final _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  loginWithGoogleCredentials() async {
    await _googleSignin.signOut();
    googleAccount.value = await _googleSignin.signIn();
  }

  //Login with Email and Password
  static Future loginWithEmailAndPassword(String email, String password) async {
    try {
      Uri url = Uri.parse(databaseUrl + '/auth/signin');
      final response =
          await http.post(url, body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        return UserAccount(
          id: 5,
          email: email,
          firstName: "firstName",
          roleId: 2,
          studentId: 5,
        );
      } else {
        final message = jsonDecode(response.body)['message'];
        return _error(response.statusCode, message);
      }
    } catch (error) {
      return _error(500, "Something went wrong! $error");
    }
  }

  //Create Account with Email and Password
  static Future registerWithEmailAndPassword(
      String email, String password, String firstName) async {
    try {
      Uri url = Uri.parse(databaseUrl + '/auth/student/register');
      final response = await http.post(url,
          body: {"email": email, "password": password, "firstName": firstName});
      if (response.statusCode == 201) {
        return UserAccount.fromJson(jsonDecode(response.body)["user"]);
      } else {
        final message = jsonDecode(response.body)['message'];
        return _error(response.statusCode, message);
      }
    } catch (error) {
      return _error(500, "Something went wrong! $error");
    }
  }

  static ErrorException _error(int statusCode, String message) {
    return ErrorException(statusCode: statusCode, errorMessage: message);
  }
  //static UserAccount _userAccount(String user){}
}

class ErrorException {
  int statusCode;
  String errorMessage;
  ErrorException({required this.statusCode, required this.errorMessage});
}
