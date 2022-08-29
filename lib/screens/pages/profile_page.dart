import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/models/user.dart';
import 'package:globaltrailblazersapp/screens/authentication/login.dart';
import 'package:globaltrailblazersapp/screens/pages/page_error.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.user}) : super(key: key);
  final UserAccount? user;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ShaderMask(
                  shaderCallback: (Rect rect) => const LinearGradient(
                    colors: <Color>[
                      Color(0xFFAF5858),
                      Color(0xFFE84D8A),
                      Color(0xFFFEB326)
                    ],
                  ).createShader(rect),
                  child: const Text(
                    "PROFILE",
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: primaryColor,
                backgroundImage: NetworkImage("${widget.user?.avatarUrl}"),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: SvgPicture.asset('assets/icons/user.svg'),
                title: const Text('Name'),
                subtitle:
                    Text("${widget.user?.firstName} ${widget.user?.lastName}"),
                trailing: SvgPicture.asset('assets/icons/edit.svg'),
              ),
              ListTile(
                leading: SvgPicture.asset('assets/icons/call.svg'),
                title: const Text('Contact'),
                subtitle: const Text('+250786385773'),
                trailing: SvgPicture.asset('assets/icons/edit.svg'),
              ),
              ListTile(
                leading: SvgPicture.asset('assets/icons/inbox.svg'),
                title: const Text('E-mail'),
                subtitle: Text('${widget.user?.email}'),
                trailing: SvgPicture.asset('assets/icons/edit.svg'),
              ),
              ListTile(
                leading: SvgPicture.asset('assets/icons/class.svg'),
                title: const Text('Class'),
                subtitle: Text("Primary ${widget.user?.gradeId}"),
                trailing: SvgPicture.asset('assets/icons/edit.svg'),
              ),
              ListTile(
                leading: SvgPicture.asset('assets/icons/school.svg'),
                title: const Text('School'),
                subtitle: const Text('Saint Charles Lwanga'),
                trailing: SvgPicture.asset('assets/icons/edit.svg'),
              ),
              ListTile(
                leading: SvgPicture.asset('assets/icons/gender.svg'),
                title: const Text('Gender'),
                subtitle: const Text('Female'),
                trailing: SvgPicture.asset('assets/icons/edit.svg'),
              ),
              ListTile(
                leading: SvgPicture.asset('assets/icons/location.svg'),
                title: const Text('School Location'),
                subtitle: const Text('Rubavu, Gisenyi, Rwanda'),
                trailing: SvgPicture.asset('assets/icons/edit.svg'),
              ),
              ListTile(
                leading: SvgPicture.asset('assets/icons/currency.svg'),
                title: const Text('Currency'),
                subtitle: const Text('RWF'),
                trailing: SvgPicture.asset('assets/icons/edit.svg'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  if (await prefs.setBool('signedIn', false) &&
                      await prefs.setStringList("user", []) &&
                      await AuthService.googleSignOut()) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PageError(
                          errorDescription:
                              "Failed to logout, please try again later",
                          errorMessage: "Logout failed",
                          statusCode: 500,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  elevation: 0.0,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('LOGOUT'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
