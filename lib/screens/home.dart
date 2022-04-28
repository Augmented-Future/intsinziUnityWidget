import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/fragments/home_fragment.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    ListView(
      children: const [HomeFragment()],
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: primaryColor,
        ),
        actions: const [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          CircleAvatar(
            backgroundColor: primaryColor,
            child: Text(
              'AH',
              style: TextStyle(color: brandYellowColor),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
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
