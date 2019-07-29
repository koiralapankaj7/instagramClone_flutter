import 'package:flutter/material.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/insta_favourite.dart';
import 'package:insta_clone/src/screens/insta_gallery.dart';
import 'package:insta_clone/src/screens/insta_profile.dart';
import 'package:insta_clone/src/screens/insta_search.dart';
import 'package:insta_clone/src/widgets/insta_activities.dart';

class InstaHome extends StatefulWidget {
  @override
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  //
  // Current active index of bottom navigation bar
  int currentIndex = 0;

  // Widgets that need to be rendered when bottom nav bar icon clicked
  List<Widget> _widgetOptions = <Widget>[
    InstaActivities(),
    InstaSearch(),
    InstaGallery(),
    InstaFavourite(),
    InstaProfile(),
  ];

  // Build function is responsible for rendering ui in home screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions[1],
      bottomNavigationBar: bottomNavBar(),
    );
  }

  // Leading widget in app bar i.e, camera icon in this application
  Widget leading() => IconButton(
        icon: Icon(
          CustomIcons.photo_camera,
          size: 32.0,
          color: Colors.black,
        ),
        onPressed: () {},
      );

  // Title of the app bar i.e, Instagram in this application
  Widget title() => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 32.0,
          ),
        ),
      );

  // Widgets in the right side of the applications i.e, igtv and send icon in this application
  List<Widget> actions() => <Widget>[
        // First item
        Stack(
          children: <Widget>[
            // IGTV button
            IconButton(
              // icon: SvgPicture.asset(
              //   UIImageData.igtv,
              //   color: Colors.black,
              // ),
              icon: Icon(
                CustomIcons.igtv,
                size: 28.0,
                color: Colors.black,
              ),
              onPressed: () {},
            ),

            // Red dot notification
            Positioned(
              top: 15.0, //15
              right: 9.0, //9.0
              child: Container(
                height: 10.0,
                width: 10.0,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),

        // Second item
        // SEND button
        Transform.rotate(
          angle: 0.4, //0.4
          child: IconButton(
            icon: Icon(
              CustomIcons.paper_plane,
              size: 28.0,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),

        // For padding
        SizedBox(width: 12.0),
      ];

  Widget bottomNavBar() {
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
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      currentIndex: currentIndex, // to do
      iconSize: 24.0,
      // showSelectedLabels: false,
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
