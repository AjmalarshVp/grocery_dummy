import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/screens/cart/model/cart_model.dart';
import 'package:meta/meta.dart';

import '../../../model/product_model.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    Map<String, CartModel> cartitem = {};
    List<ProductModel> cartProduct=[];
    on<AddItemToCart>((event, emit) {
      cartitem.putIfAbsent(
          event.productId,
          () => CartModel(
              id: DateTime.now().toString(),
              productId: event.productId,
              quantity: event.quantity));
      print(cartitem);
    });
    on<FetchCartItems>((event, emit) {

     // emit(CartProduct(cartProduct:cartitem ))
    });
  }


}
