import 'package:flutter/material.dart';
import 'package:movies/data/models/movie_category/genres.dart';
import 'package:movies/ui/screens/tabs/browse/category/show_category.dart';

class MovieType extends StatelessWidget {
  int index;
  Genres genres;

  MovieType({super.key, required this.index, required this.genres});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ShowCategory.routeName, arguments: genres);
      },
      child: Container(
        width: 160,
        height: 90,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/splash.png"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(4)),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              color: Colors.black54,
            ),
            Text(
              genres.name ?? "",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}