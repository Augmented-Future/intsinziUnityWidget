import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('We are right there'),
      ),
      body: Column(
        children: const [
          Text(
            "PROFILE",
            style: TextStyle(color: Color(0xFFAF5858)),
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
