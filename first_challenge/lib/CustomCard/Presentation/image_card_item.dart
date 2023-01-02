import 'package:flutter/material.dart';

class ImageCardItem extends StatelessWidget {
  const ImageCardItem({super.key, required this.urlImage});

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.network(
            urlImage,
            width: 100,
            height: 130,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Row(
            children: const [
              Spacer(),
              FavoriteWidget(),
            ],
          ),
        ),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }
}
