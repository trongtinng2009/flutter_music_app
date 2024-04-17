import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(
      {super.key,
      required this.url,
      required this.width,
      required this.height,
      required this.radius});
  final String url;
  final double width, height, radius;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Image.network(
        fit: BoxFit.cover,
        url,
        width: width,
        height: height,
      ),
    );
  }
}
