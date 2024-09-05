import 'package:flutter/material.dart';
import 'package:movies/ui/screens/my_home.dart';
import 'package:movies/ui/screens/splash/splash.dart';
import 'package:movies/ui/screens/tabs/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.routeName: (_) => const Splash(),
        Home.routeName: (_) => const Home(),
        MyHome.routeName: (_) => const MyHome(),
      },
      initialRoute: MyHome.routeName,
    );
  }
}
