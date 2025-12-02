import 'package:flutter/material.dart';
import 'package:mk_stationery/features/home/data/models/product/product.dart';
import 'package:mk_stationery/core/services/favorites_service.dart';

import 'cart_counter.dart';

class CounterWithFavBtn extends StatelessWidget {
  const CounterWithFavBtn({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const CartCounter(),
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.red.shade50,
          child: IconButton(
            icon: Icon(
              Icons.favorite,
              color:
                  FavoritesService().isFavorite(product.id!)
                      ? Colors.red
                      : Colors.grey,
            ),
            onPressed: () {
              FavoritesService().toggleFavorite(product);
            },
          ),
        ),
      ],
    );
  }
}
