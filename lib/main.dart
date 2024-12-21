import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zapbill/pages/intro_page.dart';
import 'package:zapbill/pages/login_page.dart';
import 'package:zapbill/pages/register_page.dart';
import 'package:zapbill/pages/splash_page.dart';
import 'package:zapbill/services/navigation_service.dart';

void main() {
  runApp(
    SplashPage(
      key: UniqueKey(),
      onInitilizationComplete: () {
        runApp(const MyApp());
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Popins',
        primaryColor: Color.fromRGBO(192, 232, 99, 1.0),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(192, 232, 99, 1.0)),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: Scaffold(),
      navigatorKey: GetIt.instance.get<NavigationService>().navigator,
      initialRoute: "/start",
      routes: {
        "/start": (BuildContext _context) => IntroPage(),
        "/login": (BuildContext _context) => LoginPage(),
        "/register": (BuildContext _context) => RegisterPage(),
      },
    );
  }
}
