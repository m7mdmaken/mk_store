part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartItemAdded extends CartState {}

final class CartItemRemoved extends CartState {}

final class CartCleared extends CartState {}

final class CartUpdated extends CartState {
  final CartEntity cartEntity;

  CartUpdated(this.cartEntity);

  bool get isEmpty => cartEntity.isEmpty;
  bool get isNotEmpty => cartEntity.isNotEmpty;
  int get itemCount => cartEntity.itemCount;
  int get totalQuantity => cartEntity.calculateTotalQuantity();
  int get totalPrice => cartEntity.calculateTotalPrice();
  List<CartItem> get cartItems => cartEntity.cartItems;
}
