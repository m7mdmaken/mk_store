import 'package:flutter/material.dart';
import 'package:mk_stationery/core/constants.dart';
import 'package:mk_stationery/features/home/data/models/product/product.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.description ?? 'No description available.',
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}
