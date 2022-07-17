import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/screens/pages/home_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _selectedIndex = 0;
  String? _selectedCategory;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    ListView(
      children: const [
        HomePage(),
      ],
    ),
    const Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    const Text(
      'Index 1: TV Zone',
      style: optionStyle,
    ),
    const Text(
      'Index 2: Books zone',
      style: optionStyle,
    ),
    const Text(
      'Index 3: Game zone',
      style: optionStyle,
    ),
  ];

  var categories = [
    "Primary 4",
    "Primary 5",
    "Primary 6",
    "Cormics",
    "Mathematics"
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedCategory = "Primary 4";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset('assets/icons/menu.svg'),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (_) => Dialog(
                backgroundColor: whiteColor,
                child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(categories[index]),
                      );
                    }),
              ),
            ),
            child: Chip(
              label: Text(
                _selectedCategory!,
                style: const TextStyle(color: primaryColor),
              ),
              deleteIcon: const Icon(Icons.arrow_drop_down),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              onDeleted: () {},
              backgroundColor: const Color(0xFFEEDA36),
            ),
          ),
          const SizedBox(width: 20),
          Badge(
            badgeContent: const Text(
              "9+",
              style: TextStyle(color: whiteColor, fontSize: 12),
            ),
            elevation: 0.0,
            child: SvgPicture.asset('assets/icons/notification.svg'),
            position: BadgePosition.topEnd(),
          ),
          const SizedBox(width: 20),
          const CircleAvatar(
            backgroundColor: primaryColor,
            backgroundImage: AssetImage('assets/images/Avatar.jpeg'),
            radius: 25,
          ),
        ]),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: brandYellowColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            label: 'TV Zone',
          ),
          BottomNavigationBarItem(
            // icon: FaIcon(FontAwesomeIcons.book),
            icon: Icon(Icons.book),
            label: 'Books Zone',
          ),
          BottomNavigationBarItem(
            // icon: FaIcon(FontAwesomeIcons.gamepad),
            icon: Icon(Icons.gamepad),
            label: 'Games Zone',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: primaryColor,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: primaryColor),
        onTap: _onItemTapped,
      ),
    );
  }
}
