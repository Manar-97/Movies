import 'package:flutter/material.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/screens/movie_details/movie_details_screen.dart';
import 'package:movies/ui/screens/my_home.dart';
import 'package:movies/ui/screens/splash/splash.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.routeName: (_) => const Splash(),
        MyHome.routeName: (_) => const MyHome(),
        MovieDetailsScreen.routeName: (_) => const MovieDetailsScreen(),
      },
      initialRoute: MyHome.routeName,
    );
  }
}
