import 'package:flutter/material.dart';

class VerticalText extends StatelessWidget {
  const VerticalText(
      {super.key,
      required this.mainText,
      required this.subText,
      this.mainSize,
      this.subSize,
      this.color});
  final String mainText, subText;
  final double? mainSize, subSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            mainText,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: mainSize, color: color),
          ),
          Text(
            subText,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: color, fontSize: subSize),
          ),
        ]);
  }
}
