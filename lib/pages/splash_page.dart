import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitilizationComplete;
  const SplashPage({required Key key, required this.onInitilizationComplete});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  
}
