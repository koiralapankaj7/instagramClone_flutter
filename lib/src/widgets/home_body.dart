import 'package:flutter/material.dart';
import 'package:insta_clone/src/widgets/stories.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Stories();
          } else {
            return post();
          }
        },
      ),
      onRefresh: () async {},
    );
  }

  Widget post() {
    return Container(
      margin: EdgeInsets.only(top: 4.0),
      height: 100.0,
      color: Colors.amber,
    );
  }
}
