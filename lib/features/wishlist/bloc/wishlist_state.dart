part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

@immutable
abstract class WishlistActionState extends WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistSuccessLoadedState extends WishlistState {
  final List<Product> products;
  WishlistSuccessLoadedState({required this.products});
}

class WishlistErrorState extends WishlistState {}

class WishlistAddProductToCartState extends WishlistActionState {}

class WishlistRemoveProductState extends WishlistActionState {}
