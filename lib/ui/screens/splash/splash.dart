import 'package:flutter/material.dart';
import 'package:movies/ui/screens/my_home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  static const String routeName = "splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, MyHome.routeName);
    });
    return Image.asset("assets/splash.png");
  }
}
