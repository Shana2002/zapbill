// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zapbill/services/navigation_service.dart';

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
      _setup().then((_) => widget.onInitilizationComplete());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "zapBill",
      home: Scaffold(
        body: Center(
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    _registerServices();
  }

  void _registerServices() {
    GetIt.instance.registerSingleton<NavigationService>(NavigationService());
  }
}
