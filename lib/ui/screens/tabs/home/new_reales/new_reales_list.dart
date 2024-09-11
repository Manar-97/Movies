import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/screens/tabs/home/new_reales/new_reales_item.dart';
import 'package:movies/ui/screens/tabs/home/new_reales/new_reales_view_model.dart';

class NewReleaseList extends StatefulWidget {
  const NewReleaseList({super.key});

  @override
  State<NewReleaseList> createState() => _NewReleaseListState();
}

class _NewReleaseListState extends State<NewReleaseList> {
  NewReleaseViewModel newReleaseViewModel = getIt();

  @override
  void initState() {
    super.initState();
    newReleaseViewModel.getNewRelease();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReleaseViewModel, NewReleaseState>(
        bloc: newReleaseViewModel,
        builder: (context, state) {
          try{
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
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ))));
                }
              case Success():
                {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => NewReleaseItem(
                      movie: state.movie[index],
                      add: () {
                        newReleaseViewModel.addToLocal(state.movie[index]);
                      },
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 15,
                    ),
                    itemCount: state.movie.length,
                  );
                }
            }
          }catch(e){
            print(e.toString());
          }
          throw"=======================";
        });
  }
}
