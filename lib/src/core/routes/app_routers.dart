import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  
  static get context => navKey.currentContext;

  static void back() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  static push(page) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static pushReplacement(page) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static pushAndRemoveUntil(page) async {
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  static pushAndRemoveUntilWithAnimation(page) async {
    await Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
          transitionDuration: const Duration(seconds: 2),
          pageBuilder: (_, __, ___) => page),
      (Route<dynamic> route) => false,
    );
  }
}
