import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:grocery_app/features/wishlist/components/wishlist_item_tile.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: wishlistBloc,
      listenWhen: (previous, current) => current is WishlistActionState,
      buildWhen: (previous, current) => current is! WishlistActionState,
      listener: (context, state) {
        if (state is WishlistAddProductToCartState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Success add product to cart')));
        } else if (state is WishlistRemoveProductState) {}
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product removed from wishlist')));
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case WishlistSuccessLoadedState:
            final loadedstate = state as WishlistSuccessLoadedState;
            return Scaffold(
                appBar: AppBar(title: const Text('Wishlist')),
                body: ListView.builder(
                  itemCount: loadedstate.products.length,
                  itemBuilder: (context, index) {
                    return WishlistItemTile(
                      product: loadedstate.products[index],
                      wishlistBloc: wishlistBloc,
                    );
                  },
                ));

          default:
            return const SizedBox();
        }
      },
    );
  }
}
