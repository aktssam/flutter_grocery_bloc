part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeNavigateToWishlistClickedEvent extends HomeEvent {}

class HomeNavigateToCartClickedEvent extends HomeEvent {}

class HomeProductToWishlistButtonClickedEvent extends HomeEvent {
  final Product clickedProduct;
  HomeProductToWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeProductToCartButtonClickedEvent extends HomeEvent {
  final Product clickedProduct;
  HomeProductToCartButtonClickedEvent({required this.clickedProduct});
}
