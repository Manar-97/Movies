import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/screens/tabs/home/recommended/recommended_item.dart';
import 'package:movies/ui/screens/tabs/home/recommended/recommended_view_model.dart';

class RecommendedList extends StatefulWidget {
  const RecommendedList({super.key});

  @override
  State<RecommendedList> createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedList> {
  RecommendedViewModel recommendedViewModel = getIt();

  @override
  void initState() {
    super.initState();
    recommendedViewModel.getRecommended();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedViewModel, RecommendedState>(
        bloc: recommendedViewModel,
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
                          movie: state.movie[index],
                          add: () {
                            recommendedViewModel.addToLocal(state.movie[index]);
                          },
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 12,
                        ),
                    itemCount: state.movie.length);
              }
          }
          throw "Something Went Wrong Please Try Again";
        });
  }
}
