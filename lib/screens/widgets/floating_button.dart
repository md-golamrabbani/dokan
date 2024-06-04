import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';

class FloatingButton {
  static Container show = Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(Dimensions.circleSize),
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          RGB.gradientTop,
          RGB.gradientBottom,
        ],
        stops: [-0.456, 1.0],
      ),
      boxShadow: const [
        BoxShadow(
          color: RGB.shadow,
          offset: Offset(0, 6),
          blurRadius: Dimensions.defaultSize,
        ),
      ],
    ),
    child: FloatingActionButton(
      elevation: 0,
      backgroundColor: Colors.transparent,
      onPressed: () {},
      child: const Icon(Icons.search),
    ),
  );
}
