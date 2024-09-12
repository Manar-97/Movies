import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/ui/screens/movie_details/movie_details_screen.dart';
import 'package:movies/ui/widgets/notification_snack_message.dart';

typedef callback = void Function();

class RecommendedItem extends StatefulWidget {
  Result movie;
  bool isFirst;
  callback add;
  RecommendedItem(
      {super.key, this.isFirst = true, required this.add, required this.movie});

  @override
  State<RecommendedItem> createState() => _RecommendedItemState();
}

class _RecommendedItemState extends State<RecommendedItem> {
  bool _isAdd = true;
  @override
  Widget build(BuildContext context) {
    String posterPath =
        "https://image.tmdb.org/t/p/w500${widget.movie.posterPath}";
    return InkWell(
      onTap: () {
        widget.isFirst
            ? Navigator.pushNamed(context, MovieDetailsScreen.routeName,
                arguments: widget.movie)
            : Navigator.pushReplacementNamed(
                context, MovieDetailsScreen.routeName,
                arguments: widget.movie);
      },
      child: Column(
        children: [
          Container(
            width: 120,
            height: 200,
            color: const Color(0xFF343534),
            // color: Theme.of(context).colorScheme.background,
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
                  imageBuilder: (context, imageProvider) => Container(
                      alignment: AlignmentDirectional.topStart,
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: InkWell(
                          onTap: () {
                            widget.add();
                            showSnackMessage("${widget.movie.title} added to watchList",context);
                            setState(() {
                              _changeImage();
                            });
                          },
                          child: _isAdd
                              ? Image.asset("assets/add.png")
                              : Image.asset("assets/added.png"))),
                ),
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            (widget.movie.voteAverage ?? 0).toStringAsFixed(1),
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Text(
                        widget.movie.title ?? "",
                        maxLines: 1,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Text(
                        widget.movie.releaseDate ?? "",
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 8,
                          color: Color(0xFFB5B4B4),
                          // color: Theme.of(context).colorScheme.onPrimary
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _changeImage() {
    setState(() {
      _isAdd = !_isAdd;
    });
  }
}
