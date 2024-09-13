import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/screens/tabs/browse/category/category_Item.dart';
import 'package:movies/ui/screens/tabs/browse/category/category_vm.dart';

class CategoryList extends StatefulWidget {
  double id;

  CategoryList({super.key, required this.id});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  CategoryViewModel categoryViewModel = getIt();

  @override
  void initState() {
    super.initState();
    categoryViewModel.getFilms(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryViewModel, CategoryState>(
        bloc: categoryViewModel,
        listener: (contex, state) {},
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
                      childAspectRatio: 1.3 / 2,
                      crossAxisSpacing: 38,
                    ),
                    itemBuilder: (context, index) => CategoryItem(
                          movieDetail: state.types[index],
                        ),
                    itemCount: state.types.length);
              }
          }
        });
  }
}
