import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/data/products.dart';
import 'package:grocery_app/features/cart/bloc/cart_bloc.dart';
import 'package:grocery_app/features/cart/components/cart_item_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartIntialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: cartBloc,
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state) {
        if (state is CartRemoveProductActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item removed')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case CartSuccessState:
            return Scaffold(
                appBar: AppBar(title: const Text('Cart')),
                body: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return CartItemTile(
                        product: cartItems[index], cartBloc: cartBloc);
                  },
                ));

          default:
            return const SizedBox();
        }
      },
    );
  }
}
