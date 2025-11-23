import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mk_stationery/features/home/data/api/api_helpers/api_error_model.dart';
import 'package:mk_stationery/features/home/data/api/api_helpers/api_result.dart';
import 'package:mk_stationery/features/home/data/models/product/category.dart';
import 'package:mk_stationery/features/home/data/models/product/product.dart';

import '../../data/repos/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsRepo repo;
  List<Product> allProducts = [];
  List<Category> categories = [];
  ProductsCubit(this.repo) : super(ProductsInitial());

  void fetchProducts() async {
    emit(ProductsLoading());
    ApiResult<List<Product>> result = await repo.getAllProducts();
    if (result is Success<List<Product>>) {
      allProducts = result.data;
      emit(ProductsLoaded(result.data));
    } else if (result is Failure<List<Product>>) {
      emit(ProductsError(result.apiErrorModel));
    }
  }

  void fetchProductsByCategory(String category) {
    emit(ProductsLoading());
    repo.getProductsGroupedByCategory().then((result) {
      if (result is Success<Map<String, List<Product>>>) {
        final categoryMap = result.data;
        final categoryProducts = categoryMap[category] ?? [];
        emit(ProductsLoaded(categoryProducts));
      } else if (result is Failure<Map<String, List<Product>>>) {
        emit(ProductsError(result.apiErrorModel));
      }
    });
  }

  void fetchCategories() {
    repo.getAllCategories().then((result) {
      if (result is Success<List<Category>>) {
        categories = result.data;
        emit(CategoriesLoaded(categories));
      } else if (result is Failure<List<Category>>) {
        emit(ProductsError(result.apiErrorModel));
      }
    });
  }
}
