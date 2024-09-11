import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/movie_datails/result_model.dart';
import 'package:movies/ui/screens/movie_details/movie_details_screen.dart';

typedef callback = void Function();

class NewReleaseItem extends StatefulWidget {
  callback add;
  Result movie;
  NewReleaseItem({super.key, required this.movie, required this.add});

  @override
  State<NewReleaseItem> createState() => _NewReleaseItemState();
}

class _NewReleaseItemState extends State<NewReleaseItem> {
  bool _isAdd = true;
  @override
  Widget build(BuildContext context) {
    String posterPath =
        "https://image.tmdb.org/t/p/w500${widget.movie.posterPath}";
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, MovieDetailsScreen.routeName,
              arguments: widget.movie);
        },
        child: CachedNetworkImage(
          imageUrl: posterPath,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Center(
            child: Text(
              "NO IMAGE",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          imageBuilder: (context, provideImage) {
            return Container(
                alignment: AlignmentDirectional.topStart,
                width: 97,
                height: 128,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: provideImage,
                )),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.add();
                        print("${widget.movie.title} added to watchList");
                        _changeImage();
                      });
                    },
                    child: _isAdd
                        ? Image.asset("assets/add.png")
                        : Image.asset("assets/added.png")));
          },
        ));
  }

  void _changeImage() {
    setState(() {
      _isAdd = !_isAdd;
    });
  }
}
