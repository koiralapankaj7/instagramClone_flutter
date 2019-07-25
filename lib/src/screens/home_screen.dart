import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/utils/ui_image_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Current active index of bottom navigation bar
  int currentIndex = 0;

  // Build function is responsible for rendering ui in home screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      // Leading i.e, left side button
      leading: IconButton(
        icon: Icon(
          CustomIcons.photo_camera,
          size: 32.0,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      titleSpacing: 8.0,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 32.0,
          ),
        ),
      ),
      // All the buttons in the right side
      actions: <Widget>[
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

        // SEND button
        Transform.rotate(
          angle: 0.4,
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
      ],
    );
  }

  Widget buildBody() {
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 4.0),
            height: 40.0,
            color: Colors.amber,
          );
        },
      ),
      onRefresh: () async {},
    );
  }

  Widget buildBottomNavigationBar() {
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
