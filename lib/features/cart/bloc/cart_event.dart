part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartIntialEvent extends CartEvent {}

class CartRemoveProductButtonClickedEvent extends CartEvent {
  final Product clickedProduct;
  CartRemoveProductButtonClickedEvent({required this.clickedProduct});
}
