import 'package:flutter/material.dart';
import 'package:mk_stationery/core/constants.dart';
import 'package:mk_stationery/features/home/data/models/product/product.dart';
import 'package:mk_stationery/features/home/ui/views/item_detalis.dart';
import 'package:mk_stationery/features/home/ui/widgets/item_card.dart';

class HomeProductsGrid extends StatelessWidget {
  const HomeProductsGrid({super.key, required this.productsList});

  final List<Product> productsList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: kDefaultPaddin,
        crossAxisSpacing: kDefaultPaddin,
        childAspectRatio: 0.60,
      ),
      itemBuilder:
          (context, index) => ItemCard(
            product: productsList[index],
            press:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            DetailsScreen(product: productsList[index]),
                  ),
                ),
          ),
    );
  }
}
