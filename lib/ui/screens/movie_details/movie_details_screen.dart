import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/ui/screens/movie_details/movie_details_build.dart';
import 'package:movies/ui/screens/movie_details/similar_movie/similar_movies_list.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});
  static const String routeName = 'MovieDetails';

  @override
  Widget build(BuildContext context) {
    Result movie = ModalRoute.of(context)?.settings.arguments as Result;
    String bgPath =
        "https://image.tmdb.org/t/p/w500${movie.backdropPath}";
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          movie.title ?? "",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: MediaQuery.of(context).size.height*0.3,
                imageUrl: bgPath,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Center(
                      child: Text(
                        "NO IMAGE",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)))),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 13, start: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title ?? "",
                          style:
                              const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        MovieDetailsBuild(id: movie.id ?? 0, movie: movie),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsetsDirectional.only(
                      start: 27,
                      top: 16,
                      bottom: 9,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "More Like This",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(child: SimilarMoviesList(id: movie.id ?? 0,)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
