import 'package:mk_stationery/features/cart/data/models/cart_item.dart';
import 'package:mk_stationery/features/home/data/models/product/product.dart';

class CartEntity {
  final List<CartItem> cartItems;

  CartEntity(this.cartItems);

  void addCartItem(CartItem cartItem) {
    cartItems.add(cartItem);
  }

  void removeCartItem(CartItem cartItem) {
    cartItems.remove(cartItem);
  }

  void removeCartItemByProduct(Product product) {
    cartItems.removeWhere((item) => item.isSameProduct(product));
  }

  void updateCartItemQuantity(Product product, int quantity) {
    final item =
        cartItems.where((item) => item.isSameProduct(product)).firstOrNull;
    if (item != null) {
      item.updateQuantity(quantity);
    }
  }

  int findProductIndex(int? productId) {
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].product.id == productId) {
        return i;
      }
    }
    return -1;
  }

  int calculateTotalPrice() {
    int totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.totalPrice;
    }
    return totalPrice;
  }

  int calculateTotalQuantity() {
    int total = 0;
    for (var item in cartItems) {
      total += item.quantity;
    }
    return total;
  }

  bool isProductExists(Product product) {
    for (var cartItem in cartItems) {
      if (cartItem.isSameProduct(product)) {
        return true;
      }
    }
    return false;
  }

  CartItem getCartItem(Product product) {
    for (var cartItem in cartItems) {
      if (cartItem.isSameProduct(product)) {
        return cartItem;
      }
    }
    return CartItem(product: product, quantity: 1);
  }

  bool get isEmpty => cartItems.isEmpty;
  bool get isNotEmpty => cartItems.isNotEmpty;
  int get itemCount => cartItems.length;
}

// Extension to add firstOrNull method
extension FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
