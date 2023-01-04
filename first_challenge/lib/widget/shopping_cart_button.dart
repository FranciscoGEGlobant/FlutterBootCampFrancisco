import 'package:first_challenge/CustomCard/domain/product.dart';
import 'package:first_challenge/bloc/shopping_cart_bloc.dart';
import 'package:first_challenge/bloc/shopping_cart_sate.dart';
import 'package:flutter/material.dart';

import '../screens/shoping_cart_screen.dart';

class ShoppingCardButton extends StatelessWidget {
  const ShoppingCardButton({super.key, required this.bloc});

  final ShoppingCartBloc bloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.stream,
        builder: (context, snapshot) {
          ShoppingCartState? state = snapshot.data;

          return IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ShopingCartScreen(
                    bloc: bloc,
                  ),
                ),
              );
            },
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                Positioned(
                  right: 0,
                  top: -2,
                  child: Visibility(
                    visible: (state is ProductCartState &&
                        state.products.isNotEmpty),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.redAccent, shape: BoxShape.circle),
                      child: Text(
                        state is ProductCartState
                            ? state.products.length.toString()
                            : "",
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
