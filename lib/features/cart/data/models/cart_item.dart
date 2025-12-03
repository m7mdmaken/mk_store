import 'package:mk_stationery/features/home/data/models/product/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  int get totalPrice => (product.price ?? 0) * quantity;

  void increaseQuantity() {
    quantity++;
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  void updateQuantity(int newQuantity) {
    quantity = newQuantity;
  }

  bool isSameProduct(Product other) {
    return product.id == other.id;
  }
}
