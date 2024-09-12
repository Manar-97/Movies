import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/screens/tabs/search/search_vm.dart';
import 'package:movies/ui/screens/tabs/watchlist/list_item.dart';

class Search extends StatelessWidget {
  Search({super.key});

  SearchViewModel searchViewModel = getIt.get<SearchViewModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsetsDirectional.only(start: 25, end: 25, top: 20),
      child: Column(
        children: [
          TextFormField(
            onChanged: (query) {
              searchViewModel.getResults(query);
            },
            cursorColor: const Color(0xFF48CFAD),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              fillColor: const Color(0xFF514F4F),
              filled: true,
              hintText: "Search",
              hintStyle: const TextStyle(color: Colors.white54, fontSize: 14),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(width: 1, color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(width: 1, color: Colors.white)),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 34,
          ),
          BlocBuilder<SearchViewModel, SearchViewModelState>(
              bloc: searchViewModel,
              builder: (context, state) {
                switch (state) {
                  case Empty():
                    {
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .3,
                          ),
                          const Icon(
                            Icons.local_movies_rounded,
                            color: Color(0xFFB5B4B4),
                            size: 100,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "No movies found",
                            style: TextStyle(
                                color: Color(0xFFB5B4B4), fontSize: 13),
                          ),
                        ],
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
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ))));
                    }
                  case Success():
                    return Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => ListItem(
                                movie: state.movies[index],
                              ),
                          separatorBuilder: (context, index) => Container(
                                height: 1,
                                width: double.infinity,
                                color: Colors.white,
                                margin: const EdgeInsetsDirectional.only(
                                    top: 9, bottom: 20),
                              ),
                          itemCount: state.movies.length),
                    );
                }
                throw "====================Error";
              })
        ],
      ),
    ));
  }
}
