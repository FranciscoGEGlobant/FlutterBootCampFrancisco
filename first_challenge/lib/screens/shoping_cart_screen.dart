import 'package:first_challenge/CustomCard/Presentation/card_item.dart';
import 'package:first_challenge/bloc/shopping_cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:first_challenge/CustomCard/domain/product.dart';

class ShopingCartScreen extends StatefulWidget {
  const ShopingCartScreen({super.key, required this.bloc});

  final ShoppingCartBloc bloc;

  @override
  State<ShopingCartScreen> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShopingCartScreen> {
  @override
  void initState() {
    super.initState();
    widget.bloc.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping cart'),
      ),
      body: StreamBuilder(
          initialData: widget.bloc.getProducts(),
          stream: widget.bloc.stream,
          builder: (context, snapshot) {
            List<Product>? products = snapshot.data;

            if (products != null && products.isNotEmpty) {
              return GridView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) => CardItem(
                  product: products[index],
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.8,
                ),
              );
            } else {
              return const Text("Empty Cart");
            }
          }),
    );
  }
}
