import 'package:mk_stationery/features/home/data/models/product/category.dart';
import 'package:mk_stationery/features/home/data/models/product/product.dart';

class CategoryProducts {
  final Category category;
  final List<Product> products;

  CategoryProducts({required this.category, required this.products});
}
