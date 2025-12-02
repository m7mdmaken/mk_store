import 'package:flutter/material.dart';
import 'package:mk_stationery/features/home/data/models/product/product.dart';

class FavoritesService extends ChangeNotifier {
  static final FavoritesService _instance = FavoritesService._();
  factory FavoritesService() => _instance;
  FavoritesService._();

  final Set<int> _favoriteIds = {};

  bool isFavorite(int productId) => _favoriteIds.contains(productId);

  void toggleFavorite(Product product) {
    if (product.id == null) return;

    if (isFavorite(product.id!)) {
      _favoriteIds.remove(product.id);
    } else {
      _favoriteIds.add(product.id!);
    }
    notifyListeners();
  }

  List<Product> getFavorites(List<Product> allProducts) {
    List<Product> favorites = [];
    for (var product in allProducts) {
      if (product.id != null && isFavorite(product.id!)) {
        favorites.add(product);
      }
    }
    return favorites;
  }
}
