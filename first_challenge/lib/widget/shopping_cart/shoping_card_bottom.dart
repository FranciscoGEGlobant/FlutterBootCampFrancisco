import 'package:flutter/material.dart';

class ShopingCardBottomCard extends StatelessWidget {
  const ShopingCardBottomCard(
      {super.key, required this.price, required this.rate, this.onDelete});

  final String price;
  final String rate;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\u0024 $price',
            maxLines: 1,
          ),
          const Spacer(),
          Text(
            rate,
            maxLines: 1,
          ),
          const Icon(
            Icons.star_rate,
            color: Colors.yellow,
            size: 20.0,
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
