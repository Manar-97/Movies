import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/screens/tabs/watchlist/list_item.dart';
import 'package:movies/ui/screens/tabs/watchlist/watchlist_vm.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  WatchListViewModel watchListViewModel = getIt();

  @override
  void initState() {
    super.initState();
    watchListViewModel.getWatchList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListViewModel, WatchListState>(
        bloc: watchListViewModel,
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ))));
              }
            case Success():
              {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 30,
                      start: 20.5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Watch List",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                            //Item(film: watchList.films?.first ?? Result(),isStart: false,)
                            child: ListView.separated(
                          itemBuilder: (context, index) => ListItem(
                            movie: state.movies[index],
                            isStart: false,
                          ),
                          separatorBuilder: (context, index) => Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.white,
                            margin: const EdgeInsetsDirectional.only(
                                top: 9, bottom: 20),
                          ),
                          itemCount: state.movies.length,
                        ))
                      ],
                    ),
                  ),
                );
              }
          }
          throw "==============Error";
        });
  }
}
