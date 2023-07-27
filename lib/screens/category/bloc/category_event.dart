part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class FetchCategoriesEvent extends CategoryEvent {

}

class SelectCategoryEvent extends CategoryEvent {
  final String selectedCategoryName;

  SelectCategoryEvent(this.selectedCategoryName);
}
