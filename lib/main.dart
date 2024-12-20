import 'package:flutter/material.dart';
import 'package:zapbill/pages/splash_page.dart';

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
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(child: Text("Hello World"),),
      ),
    );
  }
}
