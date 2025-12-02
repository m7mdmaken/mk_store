import 'package:flutter/material.dart';

import 'cart_counter.dart';

class CounterWithFavBtn extends StatelessWidget {
  const CounterWithFavBtn({super.key});

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
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
