import 'package:flutter/material.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/widgets/insta_home_body.dart';
import 'package:insta_clone/src/widgets/insta_home_bottom_nav_bar.dart';

class InstaHome extends StatefulWidget {
  @override
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  // Build function is responsible for rendering ui in home screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: leading(),
        title: title(),
        titleSpacing: 8.0, // Spacing for title
        actions: actions(),
      ),
      body: InstaHomeBody(), //insta_home_body.dart form widgets package
      bottomNavigationBar:
          InstaHomeBottomNavBar(), //insta_home_bottom_nav_bar.dart from widgets package
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
              top: 15.0,
              right: 9.0,
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
      ];
}
