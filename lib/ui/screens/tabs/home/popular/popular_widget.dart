import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/ui/screens/movie_details/movie_details_screen.dart';

class MovieWidget extends StatelessWidget {
  Result movie;
  MovieWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    String bgPath = "https://image.tmdb.org/t/p/w500${movie.backdropPath}";
    String posterPath = "https://image.tmdb.org/t/p/w500${movie.posterPath}";
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, MovieDetailsScreen.routeName,
              arguments: movie);
        },
        child: SizedBox(
            child:
                Stack(alignment: AlignmentDirectional.bottomStart, children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      bgPath,
                    ),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                const Expanded(
                    child: SizedBox(
                  height: double.infinity,
                )),
                SizedBox(
                  height: 144,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Container(
                        height: 73,
                        padding: const EdgeInsetsDirectional.only(
                            start: 60, top: 10),
                        // color: Theme.of(context).scaffoldBackgroundColor,
                        color: Colors.black,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 70,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(movie.title ?? "",
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white,
                                        fontSize: 18,
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(movie.releaseDate ?? "",
                                      style: const TextStyle(
                                          color: Color(0xFFB5B4B4),
                                          fontSize: 12)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      CachedNetworkImage(
                        imageUrl: posterPath,
                        height: 199,
                        width: 129,
                        placeholder: (context, text) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ])));
    //       Container(
    //         height: MediaQuery.of(context).size.height * 0.1,
    //         color: Colors.black,
    //       ),
    //       Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
    //         Expanded(
    //           child: CachedNetworkImage(
    //             imageUrl: posterPath,
    //             height: 199,
    //             width: 129,
    //             placeholder: (context, text) =>
    //                 const Center(child: CircularProgressIndicator()),
    //             errorWidget: (context, url, error) =>
    //                 const Icon(Icons.error),
    //           ),
    //         ),
    //         const SizedBox(
    //           width: 10,
    //         ),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               movie.title ?? "",
    //               style: const TextStyle(
    //                   overflow: TextOverflow.ellipsis,
    //                   color: Colors.white,
    //                   fontSize: 18),
    //             ),
    //             const SizedBox(
    //               height: 5,
    //             ),
    //             Text(
    //               movie.releaseDate ?? "",
    //               style: const TextStyle(
    //                   color: Color(0xFFB5B4B4), fontSize: 12),
    //             ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //           ],
    //         ),
    //       ]),
    //     ],
    //   ),
    // ));
  }
}
