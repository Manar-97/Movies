import 'package:flutter/material.dart';
import 'package:movies/data/models/movie_category/genres.dart';
import 'package:movies/ui/screens/tabs/browse/category/category_list.dart';

class ShowCategory extends StatelessWidget {
  static const String routeName = "show_category";

  const ShowCategory({super.key});

  @override
  Widget build(BuildContext context) {
    Genres type = ModalRoute.of(context)?.settings.arguments as Genres;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
              top: 70, start: 17, end: 33, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type.name ?? "",
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
              const SizedBox(
                height: 19,
              ),
              Expanded(child: CategoryList(id: type.id!.toDouble())),
            ],
          ),
        ),
      ),
    );
  }
}