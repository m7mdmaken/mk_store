import 'package:mk_stationery/features/home/data/api/api_helpers/api_error_handler.dart';
import 'package:mk_stationery/features/home/data/api/api_helpers/api_result.dart';
import 'package:mk_stationery/features/home/data/models/product/category.dart';
import 'package:mk_stationery/features/home/data/models/product/product.dart';

import '../api/web_services.dart';

class ProductsRepo {
  final WebServices apiService;

  ProductsRepo(this.apiService);

  Future<ApiResult<List<Product>>> getAllProducts() async {
    try {
      var response = await apiService.getAllProducts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleException(error));
    }
  }
  //-------------------------------//

  Future<ApiResult<Map<String, List<Product>>>>
  getProductsGroupedByCategory() async {
    try {
      final products = await apiService.getAllProducts();

      final Map<String, List<Product>> groupedProducts = {};

      for (var product in products) {
        final categoryName = product.category!.name;

        if (!groupedProducts.containsKey(categoryName)) {
          groupedProducts[categoryName!] = [];
        }

        groupedProducts[categoryName]!.add(product);
      }

      return ApiResult.success(groupedProducts);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleException(e));
    }
  }

  //-------------------------------//
  Future<ApiResult<List<Category>>> getAllCategories() async {
    try {
      var response = await apiService.getCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleException(error));
    }
  }
}
