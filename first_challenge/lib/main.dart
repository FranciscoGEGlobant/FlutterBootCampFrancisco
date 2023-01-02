import 'package:first_challenge/Constants/product_mock.dart';
import 'package:first_challenge/bloc/shopping_cart_bloc.dart';
import 'package:first_challenge/widget/shopping_cart_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomCard/Presentation/card_item.dart';
import 'package:first_challenge/CustomCard/Domain/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final products = ProductMock();
  final bloc = ShoppingCartBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Motorcycle'),
          actions: [
            ShoppingCardButton(
              bloc: bloc,
            )
          ],
        ),
        body: GridView.builder(
          itemCount: products.products.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                title: const Text('Alert'),
                content: const Text('Proceed with action?'),
                actions: [
                  Column(
                    children: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed: () {
                          bloc.addToCart(products.products[index]);
                          Navigator.pop(context);
                        },
                        child: const Text('Add To Cart'),
                      ),
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            child: CardItem(
              product: products.products[index],
            ),
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            //childAspectRatio: 0.9,
          ),
        ),
      ),
    );
  }
}
