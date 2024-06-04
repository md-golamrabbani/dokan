import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Cart Coming Soon!',
        style: TextStyle(
          fontSize: Dimensions.defaultSize,
          fontWeight: FontWeight.w800,
          color: RGB.muted,
        ),
      ),
    );
  }
}
