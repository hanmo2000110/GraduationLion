import 'package:flutter/material.dart';
import 'home.dart';
import 'recommend.dart';
import 'mypage.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  static List<Widget> pages = <Widget>[
    const HomePage(),
    const RecommendPage(),
    const MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0.0,
        iconSize: 24,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up),
            label: 'RECOMMEND',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'USER',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: const Color(0xff14171A),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xff777777),
        onTap: _onItemTapped,
      ),
    );
  }
}
