import 'package:flutter/material.dart';
import 'package:insta_clone/src/screens/insta_home.dart';

class AppRoutes {
  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return openHomeScreen(settings);
    } else {
      throw Exception('Invalid route : ${settings.name}');
    }
    // else if (settings.name.startsWith('resultScreen')) {
    //   return openResultScreen(settings);
    // }
  }

  MaterialPageRoute openHomeScreen(RouteSettings settings) {
    return MaterialPageRoute(builder: (BuildContext context) {
      return InstaHome();
    });
  }
}

final AppRoutes appRoutes = AppRoutes();
