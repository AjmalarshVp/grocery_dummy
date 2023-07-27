part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final List<String> categories;

  // final String selectedCategoryName;

  CategoryLoadedState({
    required this.categories,
  });
}
