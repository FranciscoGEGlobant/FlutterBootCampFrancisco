import 'package:flutter/material.dart';

class NameItemCard extends StatelessWidget {
  const NameItemCard({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomInfoItemCard extends StatelessWidget {
  const BottomInfoItemCard(
      {super.key, required this.price, required this.rate});

  final String price;
  final String rate;

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
        ],
      ),
    );
  }
}
