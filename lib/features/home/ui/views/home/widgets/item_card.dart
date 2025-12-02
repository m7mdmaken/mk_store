import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mk_stationery/core/constants.dart';
import 'package:mk_stationery/core/theming/color_manager.dart';
import 'package:mk_stationery/features/home/data/models/product/product.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                color: ColorsManager.offWhite,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: CachedNetworkImage(
                  imageUrl:
                      product.images?[0] ??
                      "https://images.pexels.com/photos/28216688/pexels-photo-28216688.png",
                  fit: BoxFit.fill,
                  placeholder:
                      (context, url) => Container(color: Colors.grey.shade300),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product.title ?? "-",
              style: TextStyle(color: ColorsManager.darkGray),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            "\$${product.price}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
