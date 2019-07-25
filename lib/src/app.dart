import 'package:flutter/material.dart';
import 'package:insta_clone/src/screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(canvasColor: Colors.transparent),
      // onGenerateRoute: appRoutes.routes,
      home: HomeScreen(),
    );
  }
}
