import 'package:flutter/material.dart';
import 'package:insta_clone/src/screens/insta_home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      // onGenerateRoute: appRoutes.routes,
      home: InstaHome(),
    );
  }
}
