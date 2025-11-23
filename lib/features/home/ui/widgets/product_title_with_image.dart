import 'package:flutter/material.dart';
import 'package:mk_stationery/core/constants.dart';
import 'package:mk_stationery/features/home/data/models/product/product.dart';

class ProductTitleWithImage extends StatefulWidget {
  const ProductTitleWithImage({super.key, required this.product});

  final Product product;

  @override
  State<ProductTitleWithImage> createState() => _ProductTitleWithImageState();
}

class _ProductTitleWithImageState extends State<ProductTitleWithImage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = widget.product.images ?? [];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.product.title ?? "no title",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Price\n",
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    TextSpan(
                      text: "\$${widget.product.price}",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.copyWith(
                        color: const Color.fromARGB(255, 28, 19, 19),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: kDefaultPaddin),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Hero(
                    tag: "${widget.product.id}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child:
                          imageUrls.isEmpty
                              ? Container(
                                color: Colors.grey[200],
                                alignment: Alignment.center,
                                child: const Icon(Icons.image_not_supported),
                              )
                              : Stack(
                                children: <Widget>[
                                  PageView.builder(
                                    controller: _pageController,
                                    itemCount: imageUrls.length,
                                    onPageChanged: (index) {
                                      setState(() {
                                        _currentPage = index;
                                      });
                                    },
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (context, index) => Image.network(
                                          imageUrls[index],
                                          fit: BoxFit.cover,
                                        ),
                                  ),
                                  if (imageUrls.length > 1)
                                    Positioned(
                                      bottom: 6,
                                      left: 0,
                                      right: 0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List<Widget>.generate(
                                          imageUrls.length,
                                          (index) {
                                            final bool isActive =
                                                index == _currentPage;
                                            return AnimatedContainer(
                                              duration: const Duration(
                                                milliseconds: 200,
                                              ),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 3,
                                                  ),
                                              width: isActive ? 12 : 8,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                color:
                                                    isActive
                                                        ? Colors.white
                                                        : Colors.white54,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
