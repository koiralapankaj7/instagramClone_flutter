import 'package:flutter/material.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';

class InstaHomeBottomNavBar extends StatefulWidget {
  @override
  _InstaHomeBottomNavBarState createState() => _InstaHomeBottomNavBarState();
}

class _InstaHomeBottomNavBarState extends State<InstaHomeBottomNavBar> {
  // Current active index of bottom navigation bar
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> items = [
      // First item
      BottomNavigationBarItem(
        icon: Icon(currentIndex == 0
            ? CustomIcons.home_filled
            : CustomIcons.home_lineal), // I have used custom icon here
        title: Text(''),
      ),
      // Second item
      BottomNavigationBarItem(
        icon: Icon(
          currentIndex == 1
              ? CustomIcons.search_fill
              : CustomIcons.search_lineal,
        ),
        title: Text(''),
      ),
      // Third item
      BottomNavigationBarItem(
        icon: Icon(CustomIcons.add),
        title: Text(''),
      ),
      // Fourth item
      BottomNavigationBarItem(
        icon: Icon(currentIndex == 3
            ? CustomIcons.like_fill
            : CustomIcons.like_lineal),
        title: Text(''),
      ),
      // Fifth item
      BottomNavigationBarItem(
        icon: Icon(
          currentIndex == 4
              ? CustomIcons.people_fill
              : CustomIcons.profile_lineal,
        ),
        title: Text(''),
      ),
    ];

    return BottomNavigationBar(
      items: items,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      currentIndex: currentIndex,
      iconSize: 24.0,
      showSelectedLabels: false,
      // fixedColor: Colors.black,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      selectedFontSize: 0.0,
      type: BottomNavigationBarType.fixed,
      elevation: 18.0,
      backgroundColor: Colors.white,
      // selectedIconTheme: IconThemeData(
      //   color: Colors.black,
      //   size: 20.0,
      // ),
      // unselectedIconTheme: IconThemeData(color: Colors.black),
    );
  }
}
