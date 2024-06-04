import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final Color color;

  const StarRating({required this.starCount, required this.color, Key? key})
      : assert(starCount >= 0 && starCount <= 5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: index < starCount ? color : RGB.muted,
          size: Dimensions.defaultSize,
        );
      }),
    );
  }
}
