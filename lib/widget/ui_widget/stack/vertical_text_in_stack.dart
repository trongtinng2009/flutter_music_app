import 'package:flutter/material.dart';

class VerticalTextInStack extends StatelessWidget {
  const VerticalTextInStack(
      {super.key,
      this.top,
      this.bottom,
      this.left,
      this.right,
      required this.mainText,
      required this.subText});
  final double? top, bottom, right, left;
  final String mainText, subText;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: 200,
      height: 50,
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            mainText,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            subText,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
