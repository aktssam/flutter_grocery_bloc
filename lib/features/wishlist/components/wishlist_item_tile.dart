import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/models/product_model.dart';
import 'package:grocery_app/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistItemTile extends StatelessWidget {
  const WishlistItemTile(
      {super.key, required this.product, required this.wishlistBloc});

  final Product product;
  final WishlistBloc wishlistBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      padding: const EdgeInsets.all(8.0),
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
          borderRadius: BorderRadius.circular(10)),
      child: Stack(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                height: 64,
                width: 64,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: titleStyle),
                Text(product.category, style: subtitleStyle),
                const SizedBox(height: 12),
                Text('\$${product.price}', style: titleStyle),
              ],
            ),
          ],
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 40,
          child: iconbtn(Icons.shopping_cart_outlined, () {
            wishlistBloc.add(WishlistAddProductToCartButtonClickedEvent(
                clickedProduct: product));
          }, color: Colors.blue[800]),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          child: iconbtn(Icons.delete_outline_rounded, () {
            wishlistBloc.add(WishlistRemoveProductButtonClickedEvent(
                clickedProduct: product));
          }),
        ),
      ]),
    );
  }

  static const titleStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  static const subtitleStyle = TextStyle(fontSize: 11, color: Colors.black54);

  static iconbtn(IconData icon, VoidCallback? callback,
          {Color? color = Colors.red}) =>
      IconButton(
        onPressed: callback,
        icon: Icon(icon),
        iconSize: 24,
        color: color,
      );
}
