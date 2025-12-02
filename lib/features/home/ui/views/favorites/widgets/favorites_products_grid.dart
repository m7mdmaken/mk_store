import 'package:flutter/material.dart';
import 'package:mk_stationery/core/constants.dart';
import 'package:mk_stationery/features/home/data/models/product/product.dart';
import 'package:mk_stationery/features/home/ui/views/favorites/widgets/item_card_favorites.dart';
import 'package:mk_stationery/features/home/ui/views/home/widgets/item_detalis.dart';

class FavoritesProductsGrid extends StatelessWidget {
  const FavoritesProductsGrid({super.key, required this.productsList});

  final List<Product> productsList;

  void openProductDetails(BuildContext context, Product product) {
    Navigator.of(context, rootNavigator: false).push(
      MaterialPageRoute(builder: (context) => DetailsScreen(product: product)),
    );
  }

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
      itemBuilder: (context, index) {
        Product product = productsList[index];
        return ItemCardFavorites(
          product: product,
          press: () => openProductDetails(context, product),
        );
      },
    );
  }
}
