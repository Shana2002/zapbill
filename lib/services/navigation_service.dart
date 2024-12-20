import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

  void removeAndNavigationToRoute(String page) {
    navigator.currentState!.popAndPushNamed(page);
  }

  void navigationToRoute(String page) {
    navigator.currentState!.pushNamed(page);
  }

  void navigationToPage(Widget page) {
    navigator.currentState!
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  void goBack() {
    navigator.currentState!.pop();
  }
}
