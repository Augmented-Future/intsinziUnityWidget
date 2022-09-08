import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth(context),
              height: screenHeight(context) / 3,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/okay_girl.png",
                    fit: BoxFit.cover,
                    height: screenHeight(context) / 3,
                    width: screenWidth(context),
                  ),
                  Image.asset(
                    "assets/images/twings.png",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              child: ShaderMask(
                shaderCallback: (Rect rect) => const LinearGradient(
                  colors: <Color>[
                    Color(0xFFAF5858),
                    Color(0xFFE84D8A),
                    Color(0xFFFEB326),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(rect),
                child: const Text(
                  "Always there to support you.\nSend your inquiries via one of these channels.",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 17.5,
                    height: 1.4,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SupportButton(
              onTap: () {},
              svgLogo: "assets/icons/tsap.svg",
              gradientColors: const [
                Color(0xFF14B8A6),
                Color(0xFF22C55E),
              ],
              label: "Whatsapp support",
            ),
            SupportButton(
              onTap: () {},
              svgLogo: "assets/icons/mail_filled.svg",
              gradientColors: const [
                Color(0xFFEEDA36),
                Color(0xFF193059),
              ],
              label: "email support",
            ),
            SupportButton(
              onTap: () {},
              svgLogo: "assets/icons/call_forward.svg",
              gradientColors: const [
                Color(0xFFECE12E),
                Color(0xFF22C55E),
              ],
              label: "phone call",
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(active: ""),
    );
  }
}

class SupportButton extends StatelessWidget {
  final VoidCallback onTap;
  final List<Color> gradientColors;
  final String svgLogo;
  final String label;
  const SupportButton(
      {Key? key,
      required this.onTap,
      required this.svgLogo,
      required this.gradientColors,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        splashColor: const Color(0xFFFFBF9D).withOpacity(0.4),
        child: Ink(
          width: screenWidth(context),
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: gradientColors,
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 30),
              SvgPicture.asset(
                svgLogo,
                color: whiteColor,
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Text(
                  label.toUpperCase(),
                  style: const TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
