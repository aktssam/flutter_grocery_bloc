part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

@immutable
abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<Product> products;
  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistActionState extends HomeActionState {}

class HomeNavigateToCartActionState extends HomeActionState {}

class HomeProductToWishlistActionState extends HomeActionState {}

class HomeProductToCartActionState extends HomeActionState {}
