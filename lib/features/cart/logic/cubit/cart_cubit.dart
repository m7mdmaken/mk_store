import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_stationery/features/cart/data/models/cart_entity.dart';
import 'package:mk_stationery/features/cart/data/models/cart_item.dart';
import 'package:mk_stationery/features/home/data/models/product/product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);

  void addProduct(Product product) {
    bool isProductExists = cartEntity.isProductExists(product);
    var cartItem = cartEntity.getCartItem(product);
    if (isProductExists) {
      cartItem.increaseQuantity();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(CartItemAdded());
  }

  void removeProduct(Product product) {
    var cartItem = cartEntity.getCartItem(product);
    cartEntity.removeCartItem(cartItem);
    emit(CartItemRemoved());
  }

  void updateQuantity(Product product, int quantity) {
    if (quantity <= 0) {
      removeProduct(product);
      return;
    }

    var cartItem = cartEntity.getCartItem(product);
    cartItem.updateQuantity(quantity);
    emit(CartUpdated(cartEntity));
  }

  void clearCart() {
    cartEntity = CartEntity([]);
    emit(CartCleared());
  }
}
