import 'dart:convert';

import 'package:get/get.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:globaltrailblazersapp/shared/url.dart';
import 'package:globaltrailblazersapp/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

enum IsSubmitting { submitting, error, failed, done }

class AuthService extends GetxController {
  final _googleSignin = GoogleSignIn();

  var googleAccount = Rx<GoogleSignInAccount?>(null);
  var googleGmail = Rx<GoogleSignInAccount?>(null);

  registerWithGoogleCredentials() async {
    await _googleSignin.signOut();
    googleAccount.value = await _googleSignin.signIn();
  }

  loginWithGoogleCredentials() async {
    await _googleSignin.signOut();
    googleGmail.value = await _googleSignin.signIn();
  }

  static Future<bool> googleSignOut() async {
    try {
      await GoogleSignIn().signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  //Login with Google API.
  static Future loginGoogle(String email) async {
    try {
      Uri url = Uri.parse(databaseUrl + '/auth/signin/google');
      final response = await http.post(url, body: {"email": email});
      if (response.statusCode != 200) {
        return errorMethod(
          response.statusCode,
          jsonDecode(response.body)['message'],
        );
      }
      return UserAccount.fromJson(jsonDecode(response.body)['user']);
    } catch (error) {
      return errorMethod(500, "Something went wrong! $error");
    }
  }

  //Login with Email and Password
  static Future loginWithEmailAndPassword(String email, String password) async {
    try {
      Uri url = Uri.parse(databaseUrl + '/auth/signin');
      final response = await http.post(url, body: {
        "email": email,
        "password": password,
      });
      if (response.statusCode != 200) {
        return errorMethod(
          response.statusCode,
          jsonDecode(response.body)['message'],
        );
      }
      return UserAccount.fromJson(jsonDecode(response.body)['user']);
    } catch (error) {
      return errorMethod(500, "Something went wrong! $error");
    }
  }

  //Create Account with Email and Password
  static Future registerWithEmailAndPassword(
      String email, String password, String firstName) async {
    try {
      Uri url = Uri.parse(databaseUrl + '/auth/student/register');
      final response = await http.post(url, body: {
        "email": email,
        "password": password,
        "firstName": firstName,
      });
      if (response.statusCode != 201) {
        return errorMethod(
          response.statusCode,
          jsonDecode(response.body)['message'],
        );
      }
      return UserAccount.fromJson(jsonDecode(response.body)["user"]);
    } catch (error) {
      return errorMethod(500, "Something went wrong! $error");
    }
  }
}
