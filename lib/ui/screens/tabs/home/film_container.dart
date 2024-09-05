import 'package:flutter/material.dart';

class FilmContainer extends StatelessWidget {
  String title;
  bool isRecommended;
  double? height;
  FilmContainer(
      {super.key,
      required this.title,
      this.isRecommended = false,
      this.height = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: Theme.of(context).colorScheme.secondary,
      padding: const EdgeInsetsDirectional.only(
        start: 27,
        top: 16,
        bottom: 9,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 17, color: Colors.white),
          ),
          const SizedBox(
            height: 16,
          ),
          isRecommended
              ? const Expanded(child: RecommendedBuilder())
              : const Expanded(child: NewRealeseBuilder())
        ],
      ),
    );
  }
}
