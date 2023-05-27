part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

@immutable
abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<Product> cartProducts;
  CartSuccessState({required this.cartProducts});
}

class CartRemoveProductActionState extends CartActionState {}
