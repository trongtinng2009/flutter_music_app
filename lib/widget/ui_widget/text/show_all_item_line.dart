import 'package:flutter/material.dart';
import 'package:music_app/widget/ui_widget/text/text_icon.dart';

class ShowAllItemLine extends StatelessWidget {
  const ShowAllItemLine({super.key, required this.mainText, this.color});
  final String mainText;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          mainText,
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(color: color),
        ),
        const Spacer(),
        TextIcon(
          icon: Icons.arrow_forward_ios_rounded,
          text: 'View all',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
