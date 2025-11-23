import 'package:flutter/material.dart';
import 'package:mk_stationery/core/constants.dart';
import 'package:mk_stationery/core/theming/color_manager.dart';

// We need satefull widget for our categories

class CategorySelectorRow extends StatefulWidget {
  const CategorySelectorRow({super.key});

  @override
  State<CategorySelectorRow> createState() => _CategorySelectorRowState();
}

class _CategorySelectorRowState extends State<CategorySelectorRow> {
  List<String> categories = [
    "All products",
    "Miscellaneous",
    "clothes",
    "Clothewsss",
    "Shoes",
    "Furniture",
    "Electronics",
  ];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:
                    selectedIndex == index
                        ? ColorsManager.primary
                        : ColorsManager.textDark,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: kDefaultPaddin / 8,
              ), // top padding 5
              height: 2,
              width: 30,
              color:
                  selectedIndex == index
                      ? ColorsManager.primary
                      : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
