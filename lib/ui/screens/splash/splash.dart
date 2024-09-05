import 'package:flutter/material.dart';
import 'package:movies/ui/screens/tabs/home/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  static const String routeName = "splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushNamed(context, Home.routeName);
    });
    return Image.asset("assets/splash.png");
  }
}
