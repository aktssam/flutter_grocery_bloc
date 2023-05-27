part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveProductButtonClickedEvent extends WishlistEvent {
  final Product clickedProduct;
  WishlistRemoveProductButtonClickedEvent({required this.clickedProduct});
}

class WishlistAddProductToCartButtonClickedEvent extends WishlistEvent {
  final Product clickedProduct;
  WishlistAddProductToCartButtonClickedEvent({required this.clickedProduct});
}
