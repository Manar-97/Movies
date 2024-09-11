import 'package:flutter/material.dart';
import 'package:movies/ui/screens/tabs/home/movies_container.dart';
import 'package:movies/ui/screens/tabs/home/popular/popular.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Popular(),
          const SizedBox(
            height: 20,
          ),
          MovieContainer(
            title: 'NewRelease',
          ),
          const SizedBox(
            height: 20,
          ),
          MovieContainer(
            title: 'Recommended',
            height: 250,
            isRecommended: true,
          ),
        ],
      ),
    );
  }
}
