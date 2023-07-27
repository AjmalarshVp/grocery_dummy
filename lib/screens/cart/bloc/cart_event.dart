part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddItemToCart extends CartEvent {

  final String productId;
  final double quantity;

  AddItemToCart({
    required this.productId,
    required this.quantity,
  });
}
class FetchCartItems extends CartEvent{}