import 'package:dokan/app/services/auth_service.dart';
import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          onPressed: () async {
            await AuthService.logout();
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
