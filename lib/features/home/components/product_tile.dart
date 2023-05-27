import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/models/product_model.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product, required this.homeBloc});

  final Product product;
  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 4),
              blurRadius: 8,
            )
          ],
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                height: 250,
                width: double.maxFinite,
              ),
            ),
            Positioned(
                bottom: 5,
                right: 5,
                child: iconbtn(Icons.shopping_cart_outlined, () {
                  homeBloc.add(HomeProductToCartButtonClickedEvent(
                      clickedProduct: product));
                })),
            Positioned(
              top: 5,
              right: 5,
              child: iconbtn(Icons.favorite_outline, () {
                homeBloc.add(HomeProductToWishlistButtonClickedEvent(
                    clickedProduct: product));
              }),
            ),
          ]),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.name, style: titleStyle),
              Text('\$${product.price}', style: titleStyle),
            ],
          ),
          const SizedBox(height: 6),
          Text(product.category, style: subtitleStyle),
        ],
      ),
    );
  }

  static const titleStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static const subtitleStyle = TextStyle(fontSize: 12, color: Colors.black54);

  static iconbtn(IconData icon, VoidCallback? callback) => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.black26,
          backgroundBlendMode: BlendMode.srcOver),
      child: IconButton(
        onPressed: callback,
        icon: Icon(icon),
        iconSize: 20,
        color: Colors.white,
      ));
}
