import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:grocery_app/data/products.dart';
import 'package:grocery_app/features/home/models/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeNavigateToWishlistClickedEvent>(homeNavigateToWishlistClickedEvent);
    on<HomeNavigateToCartClickedEvent>(homeNavigateToCartClickedEvent);
    on<HomeProductToWishlistButtonClickedEvent>(
        homeProductToWishlistButtonClickedEvent);
    on<HomeProductToCartButtonClickedEvent>(
        homeProductToCartButtonClickedEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: groceryProducts
            .map((obj) => Product(
                  name: obj['name'],
                  category: obj['category'],
                  price: obj['price'],
                  imageUrl: obj['imageUrl'],
                ))
            .toList()));
  }

  FutureOr<void> homeNavigateToWishlistClickedEvent(
      HomeNavigateToWishlistClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistActionState());
  }

  FutureOr<void> homeNavigateToCartClickedEvent(
      HomeNavigateToCartClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartActionState());
  }

  FutureOr<void> homeProductToWishlistButtonClickedEvent(
      HomeProductToWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductToWishlistActionState());
  }

  FutureOr<void> homeProductToCartButtonClickedEvent(
      HomeProductToCartButtonClickedEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.clickedProduct);
    emit(HomeProductToCartActionState());
  }
}
