import 'dart:async';

import 'package:first_challenge/CustomCard/domain/product.dart';
import 'package:first_challenge/bloc/shopping_cart_sate.dart';

class ShoppingCartBloc {
  final _controller = StreamController<ShoppingCartState>.broadcast();
  Stream<ShoppingCartState> get stream => _controller.stream;
  final _productsInCart = <Product>[];
  ShoppingCartState _state = EmptyCartState();

  void addToCart(Product product) {
    _productsInCart.add(product);
    _state = ProductCartState(_productsInCart);
    _controller.add(_state);
  }

  void removeFromCart(Product product) {
    _productsInCart.remove(product);
    refreshStatus();
    _controller.add(_state);
  }

  void refreshStatus() {
    _state = _productsInCart.isNotEmpty
        ? ProductCartState(_productsInCart)
        : EmptyCartState();
    _controller.add(_state);
  }

  ShoppingCartState getState() {
    return _state;
  }

  void dispose() {
    _controller.close();
  }
}
