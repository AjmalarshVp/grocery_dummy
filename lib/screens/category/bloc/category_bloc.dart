import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/dummy_date.dart';
import 'package:grocery_app/model/product_model.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  // List<String> categoryList;
  CategoryBloc() : super(CategoryInitial()) {
    on<FetchCategoriesEvent>((event, emit) {
      List<String> categoryName =
          productsList.map((e) => e.productCategoryName).toSet().toList();
      print(categoryName);
      emit(CategoryLoadedState(categories: categoryName));
    });
  }
}
