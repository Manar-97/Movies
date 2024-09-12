import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/ui/screens/movie_details/movie_details_screen.dart';

class ListItem extends StatelessWidget {
  Result movie;
  bool isStart;

  ListItem({super.key, required this.movie, this.isStart = true});

  @override
  Widget build(BuildContext context) {
    String posterPath = "https://image.tmdb.org/t/p/w500${movie.posterPath}";
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsScreen.routeName, arguments: movie);
      },
      child: Row(
        crossAxisAlignment:
        isStart ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: posterPath,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Center(
              child: Text(
                "NO IMAGE",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            width: 100,
            height: 100,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: isStart
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title ?? "",
                  maxLines: 1,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis),
                ),
                Text(
                  movie.releaseDate ?? "",
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}