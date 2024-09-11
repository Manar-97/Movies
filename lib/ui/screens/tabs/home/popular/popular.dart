import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/screens/tabs/home/popular/popular_view_model.dart';
import 'package:movies/ui/screens/tabs/home/popular/popular_widget.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  PopularViewModel popularViewModel = getIt();

  @override
  void initState() {
    super.initState();
    popularViewModel.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularViewModel, PopularState>(
      bloc: popularViewModel,
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
          case Success():
            {
              bool check = state.movie.length > 5;
              List<Widget> slider = [];
              if (check) {
                for (int i = 0; i <= 4; i++) {
                  slider.add(MovieWidget(movie: state.movie[i]));
                }
                return ImageSlideshow(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.37,
                  isLoop: true,
                  indicatorColor: Colors.transparent,
                  indicatorBackgroundColor: Colors.transparent,
                  autoPlayInterval: 3000,
                  children: slider,
                );
              }
              for (int i = 0; i < state.movie.length; i++) {
                slider.add(MovieWidget(movie: state.movie[i]));
              }
              return ImageSlideshow(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 037,
                isLoop: true,
                indicatorColor: Colors.transparent,
                indicatorBackgroundColor: Colors.transparent,
                autoPlayInterval: 3000,
                children: slider,
              );
            }
          case Error():
            {
              return SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                          child: Text(
                        state.error,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ))));
            }
        }
        throw "Something Went Wrong";
      },
    );
  }
}
// Widget build(BuildContext context) {
//   return BlocBuilder<PopularViewModel, PopularState>(
//       bloc: popularViewModel,
//       builder: (context, state) {
//         if (state is Loading) {
//           return const SafeArea(
//               child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Center(child: CircularProgressIndicator()),
//           ));
//         } else if (state is Success) {
//           hideLoading(context);
//           bool check = state.movie.length > 5;
//           List<Widget> slider = [];
//           if (check) {
//             for (int i = 0; i <= 4; i++) {
//               slider.add(MovieWidget(movie: state.movie[i]));
//             }
//             return ImageSlideshow(
//               width: double.infinity,
//               height: 289,
//               isLoop: true,
//               indicatorColor: Colors.transparent,
//               indicatorBackgroundColor: Colors.transparent,
//               autoPlayInterval: 3000,
//               children: slider,
//             );
//           }
//           for (int i = 0; i < state.movie.length; i++) {
//             slider.add(MovieWidget(movie: state.movie[i]));
//           }
//           return ImageSlideshow(
//             width: double.infinity,
//             height: 289,
//             isLoop: true,
//             indicatorColor: Colors.transparent,
//             indicatorBackgroundColor: Colors.transparent,
//             autoPlayInterval: 3000,
//             children: slider,
//           );
//         } else if (state is Error) {
//           hideLoading(context);
//           showMessage(context, body: state.error, posButtonTitle: "Ok");
//         }
//         throw "Something Went Wrong";
//       });
//}
