part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartProduct extends CartState {
  final List<ProductModel> cartProduct;

  CartProduct({required this.cartProduct});
}
