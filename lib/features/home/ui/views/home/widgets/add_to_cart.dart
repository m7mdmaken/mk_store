import 'package:flutter/material.dart';
import 'package:mk_stationery/core/constants.dart';
import 'package:mk_stationery/core/di/get_it.dart';
import 'package:mk_stationery/features/home/data/models/product/product.dart';
import 'package:mk_stationery/features/cart/logic/cubit/cart_cubit.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          // Container(
          //   margin: const EdgeInsets.only(right: kDefaultPaddin),
          //   height: 50,
          //   width: 58,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(18),
          //     // border: Border.all(),
          //   ),
          //   child: IconButton(
          //     icon: const Icon(Icons.add_shopping_cart),
          //     onPressed: () {
          //       getIt<CartCubit>().addToCart(product);
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           content: Text('${product.title} added to cart!'),
          //           duration: const Duration(seconds: 1),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                getIt<CartCubit>().addProduct(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.title} added to cart!'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                "Add to Cart",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 2, 2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
