import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/cart/ui/cart_screen.dart';
import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/components/product_tile.dart';
import 'package:grocery_app/features/wishlist/ui/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishlistScreen()));
        } else if (state is HomeNavigateToCartActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartScreen()));
        } else if (state is HomeProductToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Success added item to cart')));
        } else if (state is HomeProductToWishlistActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Success added item to wishlist')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));

          case HomeLoadedSuccessState:
            final loadedState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Grocery App'),
                backgroundColor: Colors.teal,
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeNavigateToWishlistClickedEvent());
                    },
                    icon: const Icon(Icons.favorite_outline),
                    iconSize: 24,
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeNavigateToCartClickedEvent());
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                    iconSize: 24,
                    color: Colors.white,
                  )
                ],
              ),
              body: ListView.builder(
                  itemCount: loadedState.products.length,
                  itemBuilder: ((context, index) {
                    return ProductTile(
                        homeBloc: homeBloc,
                        product: loadedState.products[index]);
                  })),
            );

          case HomeErrorState:
            return const Scaffold(body: Center(child: Text('Unknonw Error')));

          default:
            return const SizedBox();
        }
      },
    );
  }
}

// return Scaffold(
//       appBar: AppBar(
//         title: const Text('Grocery App'),
//       ),
//       body: const Center(child: Text('Welcome')),
//     );
