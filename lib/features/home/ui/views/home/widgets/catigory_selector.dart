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

  @override
  Widget build(BuildContext context) {
    List<Category> categories = context.read<ProductsCubit>().categories;
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
            return GestureDetector(
              onTap: () {
                setState(() => selectedIndex = index);
                widget.onCategorySelected(categories[index].name ?? 'Unknown');
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
                            ? ColorFilter.mode(Colors.black26, BlendMode.darken)
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
  }
}
