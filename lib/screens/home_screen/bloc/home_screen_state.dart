part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {
  final List<ProductModel> productList;
  List<ProductModel> get onSaleProducts => productList.where((product) => product.isOnSale).toList();
  HomeScreenInitial({required this.productList});
}
