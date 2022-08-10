import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/avatar.dart';
import 'package:globaltrailblazersapp/models/user.dart';
import 'package:globaltrailblazersapp/screens/authentication/auth_page_error.dart';
import 'package:globaltrailblazersapp/screens/authentication/signup_complete.dart';
import 'package:globaltrailblazersapp/services/auth_service.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';

class ChooseAvatarScreen extends StatefulWidget {
  const ChooseAvatarScreen({Key? key, required this.userInfo})
      : super(key: key);

  final UserAccount userInfo;

  @override
  State<ChooseAvatarScreen> createState() => _ChooseAvatarScreenState();
}

class _ChooseAvatarScreenState extends State<ChooseAvatarScreen> {
  List<Avatar>? avatars;
  int selectedIndexAvatar = 0;
  bool _avatarLoading = true;
  void getAvatars() async {
    dynamic result = await DatabaseService.fetchAvatars();
    if (result.runtimeType == ErrorException) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AuthPageError(
            statusCode: result.statusCode,
            message: result.errorMessage,
          ),
        ),
      );
    } else {
      setState(() {
        avatars = result;
        _avatarLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    selectedIndexAvatar = 0;
    getAvatars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(32),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_body.png"),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50),
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                'Pick avatar to use as profile picture',
                style: TextStyle(
                  fontSize: 15,
                  color: grayColor,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset('assets/images/pencil_boy.png'),
              const SizedBox(height: 20),
              SizedBox(
                width: screenWidth(context),
                height: 350,
                child: _avatarLoading
                    ? const Center(
                        child: Text(
                        "Loading, Please wait...",
                        style: TextStyle(fontSize: 18),
                      ))
                    : GridView.count(
                        crossAxisCount: 3,
                        children: List.generate(avatars!.length, (index) {
                          return Container(
                            decoration: selectedIndexAvatar == index
                                ? BoxDecoration(
                                    color: coolGreen,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: blackColor.withOpacity(0.2),
                                        offset: const Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
                                      ),
                                      const BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ],
                                  )
                                : const BoxDecoration(),
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => selectedIndexAvatar = index),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 45,
                                    backgroundColor: brandYellowColor,
                                    backgroundImage: NetworkImage(
                                      avatars![index].url,
                                    ),
                                  ),
                                  Text(
                                    avatars![index].name,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: selectedIndexAvatar == index
                                          ? whiteColor
                                          : primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SignupComplete(user: widget.userInfo),
                    ),
                    (route) => false),
                child: Container(
                  width: 260,
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 16,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    color: brandYellowColor.withOpacity(0.85),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: const Text(
                    'Finish',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
