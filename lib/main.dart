import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/screens/login.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: FractionalOffset.bottomCenter,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
          ),
          child: const SingleChildScrollView(
            child: TipWidget(),
          ),
        ),
      ),
    );
  }
}

class TipWidget extends StatefulWidget {
  const TipWidget({Key? key}) : super(key: key);

  @override
  _TipWidgetState createState() => _TipWidgetState();
}

class _TipWidgetState extends State<TipWidget> {
  int _index = 0;

  var texts = [
    [
      'A one stop center for engaging',
      'Rwanda’s competency based',
      'curriculum courses',
    ],
    [
      'Play and Learn with Keza and',
      'Manzi. Enablers of the digital',
      'future are here',
    ],
    [
      'Play and Learn with Keza and',
      'Manzi. Enablers of the digital',
      'future are here',
    ],
  ];

  var avatars = [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png'
  ];

  void _nextTip() {
    setState(() {
      if (_index >= 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } else {
        _index++;
      }
    });
  }

  Color _getColor(index) {
    if (_index == index) {
      return Colors.white;
    }
    return grayColor;
  }

  // ···
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 32,
                right: 32,
                top: 32,
              ),
              child: const Text(
                'SKIP',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
      Container(
        padding: const EdgeInsets.all(32),
        child: Image.asset(
          avatars[_index],
          width: 600,
          height: 240,
          fit: BoxFit.contain,
        ),
      ),
      Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        padding: const EdgeInsets.only(
          left: 32,
          right: 32,
          top: 48,
          bottom: 48,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              texts[_index][0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              texts[_index][1],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Text(
            texts[_index][2],
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            padding: const EdgeInsets.only(top: 48, bottom: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 6,
                  width: _index == 0 ? 31 : 14,
                  decoration: BoxDecoration(
                    color: _getColor(0),
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  height: 6,
                  width: _index == 1 ? 31 : 14,
                  decoration: BoxDecoration(
                    color: _getColor(1),
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  height: 6,
                  width: _index == 2 ? 31 : 14,
                  decoration: BoxDecoration(
                    color: _getColor(2),
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: _nextTip,
            child: Container(
              padding: const EdgeInsets.only(
                left: 48,
                right: 48,
                top: 16,
                bottom: 16,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bgButton.png"),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: const Text(
                'GO',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ]),
      ),
    ]);
  }
}
