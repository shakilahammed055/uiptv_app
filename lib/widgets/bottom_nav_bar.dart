import 'package:flutter/material.dart';
import 'package:test_app/screens/dummy_screen.dart';
import 'package:test_app/screens/home_screen.dart';

class MainRoute extends StatefulWidget {
  @override
  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {
  int _bottomNavIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    DummyScreen(title: "View"),
    DummyScreen(title: "Download"),
    DummyScreen(title: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF11161F),
      body: _pages[_bottomNavIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1C212A),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
          bottom: Radius.circular(40),
        ),
      ),
      padding: EdgeInsets.all(10),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: Color(0XFFFF3440),
        unselectedItemColor: Color(0XFF666666),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.desktop_windows),
            label: 'Desktop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
