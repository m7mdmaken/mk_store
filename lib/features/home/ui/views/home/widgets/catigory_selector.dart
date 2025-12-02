import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mk_stationery/core/constants.dart';
import 'package:mk_stationery/features/home/data/models/product/category.dart';
import 'package:mk_stationery/features/home/logic/cubit/products_cubit.dart';

class CategorySelector extends StatefulWidget {
  final Function(String) onCategorySelected;
  const CategorySelector({super.key, required this.onCategorySelected});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  bool _hasInitialSelection = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        List<Category> categories = [];

        if (state is CategoriesLoaded) {
          categories = [...state.categories];
        } else if (state is ProductsLoaded) {
          categories = [...context.read<ProductsCubit>().categories];
        }

        if (!categories.any((category) => category.name == 'All Products')) {
          final allProductsCategory = Category(
            name: 'All Products',
            image: 'https://placehold.co/150x100?text=All',
          );
          categories.insert(0, allProductsCategory);
        }

        if (categories.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 80.h,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 160.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 80.h,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final selected = index == selectedIndex;

                if (!_hasInitialSelection && categories.isNotEmpty) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      selectedIndex = 0;
                      _hasInitialSelection = true;
                    });
                    widget.onCategorySelected('All Products');
                  });
                }

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      _hasInitialSelection = true;
                    });
                    widget.onCategorySelected(
                      categories[index].name ?? 'Unknown',
                    );
                  },
                  child: Container(
                    width: 160.w,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color:
                          selected
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                          categories[index].image ??
                              "https://placehold.co/150x100?text=MK",
                        ),
                        fit: BoxFit.fitWidth,
                        colorFilter:
                            selected
                                ? ColorFilter.mode(
                                  Colors.black26,
                                  BlendMode.darken,
                                )
                                : null,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        categories[index].name ?? 'Unknown',
                        style: TextStyle(
                          color:
                              selected
                                  ? Colors.white
                                  : const Color.fromARGB(221, 38, 255, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
