import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/ui/screens/movie_details/movie_details_screen.dart';

class CategoryItem extends StatelessWidget {
  Result movieDetail;

  CategoryItem({super.key, required this.movieDetail});

  @override
  Widget build(BuildContext context) {
    String posterPath =
        "https://image.tmdb.org/t/p/w500${movieDetail.posterPath}";
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsScreen.routeName, arguments: movieDetail);
      },
      child: Column(
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
            width: 200,
            height: 200,
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Text(
              movieDetail.title ?? "",
              maxLines: 1,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Color(0xFFFFFFFF),
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}