import 'package:bloc_example/Screens/recyclebin_screen.dart';
import 'package:bloc_example/Screens/tabs_screen.dart';
import 'package:bloc_example/Screens/pending_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBinScreen.id:
        return MaterialPageRoute(builder: (ctx) => const RecycleBinScreen());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (ctx) => TabsScreen());
      default:
        return null;
    }
  }
}
