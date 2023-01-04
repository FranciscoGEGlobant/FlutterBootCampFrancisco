import 'package:first_challenge/bloc/shopping_cart_bloc.dart';
import 'package:first_challenge/bloc/shopping_cart_sate.dart';
import 'package:first_challenge/widget/shopping_cart/shoping_card_cart.dart';
import 'package:flutter/material.dart';

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
    widget.bloc.refreshStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping cart'),
      ),
      body: StreamBuilder(
          initialData: widget.bloc.getState(),
          stream: widget.bloc.stream,
          builder: (context, snapshot) {
            ShoppingCartState? state = snapshot.data;
            if (state is EmptyCartState) {
              return const Center(child: Text("Empty Cart"));
            }
            if (state is ProductCartState) {
              return GridView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) => ShopingCardItem(
                  onDelete: () =>
                      {widget.bloc.removeFromCart(state.products[index])},
                  product: state.products[index],
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.8,
                ),
              );
            } else {
              return const Center(child: Text("Empty Cart"));
            }
          }),
    );
  }
}
