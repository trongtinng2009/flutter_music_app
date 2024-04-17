import 'package:flutter/material.dart';

class BackgroundIcon extends StatelessWidget {
  const BackgroundIcon({
    super.key,
    required this.onClick,
    required this.icon,
    this.radius,
    this.bgColor,
  });
  final void Function() onClick;
  final double? radius;
  final IconData icon;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: bgColor,
        radius: 20,
        child: IconButton(
          onPressed: () => onClick(),
          icon: Icon(icon),
        ));
  }
}
