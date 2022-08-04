import 'dart:convert';

import 'package:globaltrailblazersapp/constants/url.dart';
import 'package:globaltrailblazersapp/models/animations_content.dart';
import 'package:globaltrailblazersapp/models/avatar.dart';
import 'package:globaltrailblazersapp/services/auth_service.dart';
import 'package:http/http.dart' as http;

class DatabaseService {
  //Getting animations from Database
  static Future fetchAnimations() async {
    try {
      Uri url = Uri.parse(databaseUrl + '/animations');
      final response = await http.get(url);
      final decoded = jsonDecode(response.body);
      List<AnimationsContent> remoteAnimations = [];
      if (response.statusCode == 200) {
        for (var i = 0; i < decoded['data'].length; i++) {
          remoteAnimations.add(AnimationsContent.fromJson(decoded['data'][i]));
        }
        return remoteAnimations;
      } else {
        final message = decoded['message'];
        return _error(response.statusCode, message);
      }
    } catch (e) {
      return _error(500, "Something went wrong, $e");
    }
  }

  //Getting Avatars from database
  static Future fetchAvatars() async {
    try {
      Uri url = Uri.parse(databaseUrl + '/avatars');
      final response = await http.get(url);
      final decoded = jsonDecode(response.body);
      List<Avatar> remoteAvatars = [];
      if (response.statusCode == 200) {
        for (var i = 0; i < decoded['data'].length; i++) {
          remoteAvatars.add(Avatar.fromJson(decoded['data'][i]));
        }
        return remoteAvatars;
      } else {
        final message = decoded['message'];
        return _error(response.statusCode, message);
      }
    } catch (e) {
      return _error(500, "Something went wrong, $e");
    }
  }

  static ErrorException _error(int statusCode, String message) {
    return ErrorException(statusCode: statusCode, errorMessage: message);
  }
}
