import 'package:dokan/app/services/auth_service.dart';
import 'package:dokan/utils/button.dart';
import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            'Product Coming Soon!',
            style: TextStyle(
              fontSize: Dimensions.defaultSize,
              fontWeight: FontWeight.w800,
              color: RGB.muted,
            ),
          ),
        ),
        ElevatedButton(
          style: Button.success,
          onPressed: () async {
            await AuthService.logout();
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
