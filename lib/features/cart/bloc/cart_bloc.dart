import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:grocery_app/data/products.dart';
import 'package:grocery_app/features/home/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartIntialEvent>(cartInitialEvent);
    on<CartRemoveProductButtonClickedEvent>(
        cartRemoveProductButtonClickedEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartIntialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartProducts: cartItems));
  }

  FutureOr<void> cartRemoveProductButtonClickedEvent(
      CartRemoveProductButtonClickedEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.clickedProduct);
    emit(CartSuccessState(cartProducts: cartItems));
    emit(CartRemoveProductActionState());
  }
}
