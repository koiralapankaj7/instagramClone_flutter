import 'package:flutter/material.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/widgets/bottom_nav_bar.dart';
import 'package:insta_clone/src/widgets/home_body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Build function is responsible for rendering ui in home screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: HomeBody(), //home_body.dart
      bottomNavigationBar: BottomNavBar(), //bottom_nav_bar.dart
    );
  }

  Widget buildAppBar() {
    //
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

      titleSpacing: 8.0, // Spacing for title

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
}
