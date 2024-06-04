import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Coming Soon!',
        style: TextStyle(
          fontSize: Dimensions.defaultSize,
          fontWeight: FontWeight.w800,
          color: RGB.muted,
        ),
      ),
    );
  }
}
