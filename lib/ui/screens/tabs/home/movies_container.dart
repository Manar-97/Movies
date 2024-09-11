import 'package:flutter/material.dart';
import 'package:movies/ui/screens/tabs/home/new_reales/new_reales_list.dart';
import 'package:movies/ui/screens/tabs/home/recommended/recommended_list.dart';

class MovieContainer extends StatelessWidget {
  String title;
  bool isRecommended;
  double? height;
  MovieContainer(
      {super.key,
      required this.title,
      this.isRecommended = false,
      this.height = 185});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: const Color(0xFF282A28),
      // color: Theme.of(context).colorScheme.secondary,
      padding: const EdgeInsetsDirectional.only(
        start: 10,
        top: 5,
        bottom: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          isRecommended
              ? const Expanded(child: RecommendedList())
              : const Expanded(child: NewReleaseList())
        ],
      ),
    );
  }
}
