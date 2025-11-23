part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  final List<Product> products;
  ProductsLoaded(this.products);
}

final class CategoriesLoaded extends ProductsState {
  final List<Category> categories;
  CategoriesLoaded(this.categories);
}

final class ProductsError extends ProductsState {
  final ApiErrorModel apiErrorModel;
  ProductsError(this.apiErrorModel);
}
