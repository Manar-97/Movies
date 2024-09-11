import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/screens/movie_details/similar_movie/similar_movie_view_model.dart';
import 'package:movies/ui/screens/tabs/home/recommended/recommended_item.dart';

class SimilarMoviesList extends StatefulWidget {
  num id;

  SimilarMoviesList({super.key, required this.id});

  @override
  State<SimilarMoviesList> createState() => _SimilarMoviesListState();
}

class _SimilarMoviesListState extends State<SimilarMoviesList> {
  SimilarMoviesViewModel similarMoviesViewModel = getIt();

  @override
  void initState() {
    super.initState();
    similarMoviesViewModel.getSimilar(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMoviesViewModel, SimilarMoviesState>(
        bloc: similarMoviesViewModel,
        builder: (context, state) {
          switch (state) {
            case Loading():
              {
                return const SafeArea(
                    child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(child: CircularProgressIndicator()),
                ));
              }
            case Error():
              {
                return SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                            child: Text(
                          state.error,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ))));
              }

            case Success():
              {
                return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => RecommendedItem(
                          movie: state.movies[index],
                          isFirst: false,
                          add: () {
                            similarMoviesViewModel
                                .addToLocal(state.movies[index]);
                            print(
                                "${state.movies[index].title} added to watch list");
                          },
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                    itemCount: state.movies.length);
              }
          }
        });
  }
}
