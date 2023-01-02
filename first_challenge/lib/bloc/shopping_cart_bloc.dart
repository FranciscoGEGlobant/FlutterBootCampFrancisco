import 'dart:async';

import 'package:first_challenge/CustomCard/domain/product.dart';
import 'package:first_challenge/bloc/shopping_cart_sate.dart';

class ShoppingCartBloc {
  final _controller = StreamController<List<Product>>.broadcast();
  Stream<List<Product>> get stream => _controller.stream;
  final _products = <Product>[];

  //final _stateController = StreamController<ShoppingCartState>();
  //Stream<ShoppingCartState> get state => _stateController.stream;

  void addToCart(Product product) {
    _products.add(product);
    _controller.add(_products);
  }

  void removeFromCart(Product product) {
    _products.remove(product);
    _controller.add(_products);
  }

  void refreshProducts() {
    _controller.add(_products);
  }

  List<Product> getProducts() {
    return _products;
  }

  void dispose() {
    _controller.close();
  }
}
