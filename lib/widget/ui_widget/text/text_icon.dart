import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  const TextIcon(
      {super.key, required this.icon, required this.text, this.style});
  final IconData icon;
  final TextStyle? style;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: style,
        ),
        Icon(
          icon,
          size: 10,
        ),
      ],
    );
  }
}
