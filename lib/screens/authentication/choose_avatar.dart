import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/avatar.dart';
import 'package:globaltrailblazersapp/screens/authentication/verify_phone.dart';

class ChooseAvatarScreen extends StatefulWidget {
  const ChooseAvatarScreen({Key? key}) : super(key: key);

  @override
  State<ChooseAvatarScreen> createState() => _ChooseAvatarScreenState();
}

class _ChooseAvatarScreenState extends State<ChooseAvatarScreen> {
  List<Avatar> avatars = [
    Avatar(
      avatarId: '1',
      color: const Color(0xFF892383),
      imgUrl:
          'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_1280.png',
      name: 'Male',
    ),
    Avatar(
      avatarId: '1',
      color: const Color(0xFF892383),
      imgUrl:
          'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_1280.png',
      name: 'Male',
    ),
    Avatar(
      avatarId: '1',
      color: const Color(0xFF892383),
      imgUrl:
          'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_1280.png',
      name: 'Male',
    ),
    Avatar(
      avatarId: '1',
      color: const Color(0xFF892383),
      imgUrl:
          'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_1280.png',
      name: 'Male',
    ),
    Avatar(
      avatarId: '1',
      color: const Color(0xFF892383),
      imgUrl:
          'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_1280.png',
      name: 'Male',
    ),
    Avatar(
      avatarId: '1',
      color: const Color(0xFF892383),
      imgUrl:
          'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_1280.png',
      name: 'Male',
    ),
  ];
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
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(avatars.length, (index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: avatars[index].color,
                        backgroundImage: NetworkImage(avatars[index].imgUrl),
                      ),
                      Text(
                        avatars[index].name,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                    ],
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const VerifyPhoneScreen())),
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
                  'Next',
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
    );
  }
}
