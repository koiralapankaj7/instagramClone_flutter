import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/src/customIcons/home_filled_icons.dart';
import 'package:insta_clone/src/utils/ui_image_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Build function is responsible for rendering ui in home screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      // Leading i.e, left side button
      leading: IconButton(
        padding: EdgeInsets.all(12.0),
        icon: SvgPicture.asset(
          UIImageData.camera,
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
          padding: EdgeInsets.all(12.0),
          icon: SvgPicture.asset(
            UIImageData.igtv,
            color: Colors.black,
          ),
          onPressed: () {},
        ),

        // SEND button
        Transform.rotate(
          angle: 0.4,
          child: IconButton(
            padding: EdgeInsets.all(12.0),
            icon: SvgPicture.asset(
              UIImageData.send,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),

        // For padding
        SizedBox(width: 8.0),
      ],
    );
  }

  Widget buildBody() {
    return Column();
  }

  Widget buildBottomNavigationBar() {
    final List<BottomNavigationBarItem> items = [
      // First item
      BottomNavigationBarItem(
        icon: Icon(HomeFilled.home_filled),
        title: Text(''),
      ),
      // Second item
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        title: Text(''),
      ),
      // Third item
      BottomNavigationBarItem(
        icon: Icon(Icons.add_box),
        title: Text(''),
      ),
      // Fourth item
      BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.heart),
        title: Text(''),
      ),
      // Fifth item
      BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.peopleCarry),
        title: Text(''),
      ),
    ];

    return BottomNavigationBar(
      items: items,
      backgroundColor: Colors.blue,
      elevation: 20.0,
      selectedIconTheme: IconThemeData(color: Colors.black),
      unselectedIconTheme: IconThemeData(color: Colors.black54),
    );
  }
}
