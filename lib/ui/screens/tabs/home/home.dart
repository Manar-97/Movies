import 'package:flutter/material.dart';
import 'package:movies/data/models/popular_model.dart';
import 'package:movies/ui/screens/tabs/home/popular_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTabIndex =0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  // Image.asset('name'),
                  const Text("data"),
                  const Text("data"),
                ],
              ),
            ],
          ),
          PopularList
        ],
      ),
    );
  }
  //
  // Widget buildPopularList(List<Results> results) {
  //   List<Widget> tabs = results
  //       .map((result) =>
  //           mapResultToTab(result, selectedTabIndex == results.indexOf(result)))
  //       .toList();
  //   return ListView.builder(
  //     itemCount: results.length,
  //       itemBuilder: itemBuilder
  //   );
  // }
  //
  // Widget mapResultToTab(Results result, bool isSelected) {
  //   return ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: list.length,
  //       itemBuilder: (context, index) => buildMovieItem(context, list[index]));
  // }
  // Widget buildPopularList(List<Results> results) {
  //   return ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: results.length,
  //       itemBuilder: (context, index) => buildMovieItem(context, results[index]));
  // }
  //
  // Column buildMovieItem(BuildContext context, Results result) {
  //   return Column(
  //     children: [
  //       Image.asset(results.backdropPath ?? ""),
  //       Row(
  //         children: [
  //           const Icon(Icons.star),
  //           Text(results.voteAverage ?? ""),
  //         ],
  //       ),
  //       Text(results.title ?? ""),
  //       // Text(results.genreIds ?? ""),
  //     ],
  //   );
  // }
}


