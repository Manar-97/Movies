import 'package:flutter/material.dart';
import 'package:movies/ui/screens/tabs/browse/browse.dart';
import 'package:movies/ui/screens/tabs/home/home.dart';
import 'package:movies/ui/screens/tabs/search/search.dart';
import 'package:movies/ui/screens/tabs/watchlist/watchlist.dart';
import 'package:movies/ui/utlis/app_colors.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  static const String routeName = "my_home";

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs =  [
      const Home(),
      Search(),
      const Browse(),
      const WatchList(),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: tabs[currentIndex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 0,
      selectedItemColor: AppColors.selectedItem,
      unselectedItemColor: AppColors.unSelectedItem,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
            backgroundColor: AppColors.navigationBarBG,
            icon: Icon(Icons.home),
            label: 'Home'),
        BottomNavigationBarItem(
            backgroundColor: AppColors.navigationBarBG,
            icon: Icon(Icons.search),
            label: 'Search'),
        BottomNavigationBarItem(
            backgroundColor: AppColors.navigationBarBG,
            icon: Icon(Icons.movie_creation),
            label: 'Browse'),
        BottomNavigationBarItem(
            backgroundColor: AppColors.navigationBarBG,
            icon: Icon(Icons.book_rounded),
            label: 'Watchlist'),
      ],
    );
  }
}
