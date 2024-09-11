import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/screens/movie_details/film_tag.dart';
import 'package:movies/ui/screens/movie_details/movie_details_view_model.dart';

class MovieDetailsBuild extends StatefulWidget {
  num id;
  Result movie;
  MovieDetailsBuild({super.key, required this.movie, required this.id});

  @override
  State<MovieDetailsBuild> createState() => _MovieDetailsBuildState();
}

class _MovieDetailsBuildState extends State<MovieDetailsBuild> {
  MovieDetailsViewModel movieDetailsViewModel = getIt();

  @override
  void initState() {
    super.initState();
    movieDetailsViewModel.getMovieDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsViewModel, MovieDetailsState>(
        bloc: movieDetailsViewModel,
        builder: (context, state) {
          switch (state) {
            case Success():
              {
                String posterPath =
                    "https://image.tmdb.org/t/p/w500${state.movie.posterPath}";
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          state.movie.releaseDate ?? "",
                          style: const TextStyle(
                            color: Color(0xFFB5B4B4),
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          " ${(state.movie.runtime) ?? 0 ~/ 60}h",
                          style: const TextStyle(
                            color: Color(0xFFB5B4B4),
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: posterPath,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Center(
                            child: Text(
                              "NO IMAGE",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          imageBuilder: (context, imageProvider) => Container(
                            alignment: AlignmentDirectional.topStart,
                            width: 130,
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
                            child: InkWell(
                                onTap: () {
                                  movieDetailsViewModel
                                      .addToLocal(widget.movie);
                                  print(
                                      "${widget.movie.title} added to watch list");
                                },
                                child:
                                    Image.asset("assets/add.png")),
                          ),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 90,
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 3.5,
                                              crossAxisSpacing: 12,
                                              mainAxisSpacing: 15),
                                      itemBuilder: (context, index) => MovieTag(
                                        type: state.movie.genres?[index].name,
                                      ),
                                      itemCount: state.movie.genres?.length,
                                    ),
                                  ),
                                  Expanded(
                                      child: SingleChildScrollView(
                                    child: Text(
                                      state.movie.overview ?? "",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          height: 1.5,
                                          fontSize: 13),
                                    ),
                                  )),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Color(0xFFFFA90A),
                                        // color: Theme.of(context).primaryColor,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        (state.movie.voteAverage ?? 0)
                                            .toStringAsFixed(1),
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ))));
              }
          }
          throw "Something Went Wrong Please Try Again";
        });
  }
}
