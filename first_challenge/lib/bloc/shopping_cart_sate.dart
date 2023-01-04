import 'package:first_challenge/CustomCard/domain/product.dart';

class ShoppingCartState {}

class EmptyCartState extends ShoppingCartState {}

class LoadingCartState extends ShoppingCartState {}

class ProductCartState extends ShoppingCartState {
  final List<Product> products;

  ProductCartState(this.products);
}
