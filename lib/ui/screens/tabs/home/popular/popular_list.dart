import 'package:flutter/material.dart';
import 'package:movies/data/api_manager.dart';
import 'package:movies/data/models/popular_model.dart';
import 'package:movies/ui/widgets/error_view.dart';
import 'package:movies/ui/widgets/loading_view.dart';

class PopularList extends StatelessWidget {
  final Results results;
  const PopularList({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Popular>(
        future: ApiManager.getPopular(results.id!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorView(
                error: snapshot.error.toString(), onRetryClick: () {});
          } else if (snapshot.hasData) {
            return buildPopularList(snapshot.data!.results!);
          } else {
            return const LoadingView();
          }
        });
  }

  Widget buildPopularList(List<Results> list) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) => buildMovieItem(context, list[index]));
  }

  Column buildMovieItem(BuildContext context, Results results) {
    return Column(
      children: [
        Image.asset(results.backdropPath ?? ""),
        Row(
          children: [
            const Icon(Icons.star),
            Text(results.voteAverage ?? ""),
          ],
        ),
        Text(results.title ?? ""),
        // Text(results.genreIds ?? ""),
      ],
    );
  }
}
