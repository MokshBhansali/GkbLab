import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'tab/homeScreen.dart';
import 'tab/logoutScreen.dart';
import 'tab/profileScreen.dart';
import '../global/colors.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List<Widget> children = [
    HomeScreen(),
    LogoutScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[currentIndex],
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
              backgroundColor: ColorPlate.WhiteColor,
              icon: Icon(Icons.school),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: ColorPlate.WhiteColor,
              icon: Icon(Icons.logout),
              label: 'Logout',
            ),
            BottomNavigationBarItem(
              backgroundColor: ColorPlate.WhiteColor,
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          backgroundColor: ColorPlate.BlackColor,
          mouseCursor: MouseCursor.defer,
          unselectedItemColor: ColorPlate.WhiteColor.withOpacity(.7),
          selectedItemColor: ColorPlate.BlueColor,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
