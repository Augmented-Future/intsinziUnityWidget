import 'package:get/get.dart';
import 'package:globaltrailblazersapp/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAccountController extends GetxController {
  var userAccountInfo = Rx<UserAccount?>(null);

  setUserData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? userString = prefs.getStringList("user");
    userAccountInfo.value = UserAccount(
      id: int.parse(userString![0]),
      email: userString[2],
      firstName: userString[3],
      lastName: userString[4],
      avatarUrl: userString[5],
      gradeId: int.parse(userString[1]),
    );
  }
}
