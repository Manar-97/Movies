import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/screens/tabs/browse/browser_vm.dart';
import 'package:movies/ui/screens/tabs/browse/category/movie_type.dart';

class BrowderBuild extends StatefulWidget {
  const BrowderBuild({super.key});

  @override
  State<BrowderBuild> createState() => _BrowderBuildState();
}

class _BrowderBuildState extends State<BrowderBuild> {
  BrowserViewModel browserViewModel = BrowserViewModel();

  @override
  void initState() {
    super.initState();
    browserViewModel.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowserViewModel, BrowserState>(
        bloc: browserViewModel,
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
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 38,
                    mainAxisSpacing: 47,
                  ),
                  itemBuilder: (context, index) {
                    return MovieType(
                      index: index,
                      genres: state.types[index],
                    );
                  },
                  itemCount: state.types.length,
                );
              }
          }
        });
  }
}