import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:grocery_app/data/products.dart';
import 'package:grocery_app/features/home/models/product_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistAddProductToCartButtonClickedEvent>(
        wishlistAddProductToCartButtonClickedEvent);
    on<WishlistRemoveProductButtonClickedEvent>(
        wishlistRemoveProductButtonClickedEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessLoadedState(products: wishlistItems));
  }

  FutureOr<void> wishlistAddProductToCartButtonClickedEvent(
      WishlistAddProductToCartButtonClickedEvent event,
      Emitter<WishlistState> emit) {
    cartItems.add(event.clickedProduct);
    emit(WishlistAddProductToCartState());
  }

  FutureOr<void> wishlistRemoveProductButtonClickedEvent(
      WishlistRemoveProductButtonClickedEvent event,
      Emitter<WishlistState> emit) {
    wishlistItems.remove(event.clickedProduct);
    emit(WishlistRemoveProductState());
  }
}
