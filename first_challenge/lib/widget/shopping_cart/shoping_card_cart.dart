import 'package:first_challenge/CustomCard/domain/product.dart';
import 'package:first_challenge/CustomCard/Presentation/bottom_info_card.dart';
import 'package:first_challenge/CustomCard/Presentation/image_card_item.dart';
import 'package:first_challenge/widget/shopping_cart/shoping_card_bottom.dart';
import 'package:flutter/material.dart';

class ShopingCardItem extends StatelessWidget {
  const ShopingCardItem({super.key, required this.product, this.onDelete});

  final Product product;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 2.0,
        shadowColor: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: ImageCardItem(urlImage: product.urlImage)),
              NameItemCard(name: product.name),
              ShopingCardBottomCard(
                price: product.price,
                rate: product.rate,
                onDelete: onDelete,
              )
            ],
          ),
        ),
      ),
    );
  }
}
