import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/keys.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';

class SnackBars {
  static showErrorSnackbar({required dynamic text}) {
    final snackBar = SnackBar(
      content: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.defaultSize,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Dimensions.defaultSize,
          ),
          boxShadow: [
            BoxShadow(
              color: RGB.primary.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: Dimensions.defaultSize / 2,
            horizontal: 0,
          ),
          minLeadingWidth: Dimensions.defaultSize,
          leading: const Icon(
            Icons.info,
            color: RGB.white,
          ),
          title: Text(
            text,
            style: const TextStyle(
              color: RGB.white,
              fontSize: Dimensions.defaultSize - 2,
            ),
          ),
        ),
      ),
      backgroundColor: RGB.primary,
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.defaultSize),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(Keys.navigator.currentContext!).showSnackBar(snackBar);
  }

  static showSuccessSnackbar({required String text}) {
    final snackBar = SnackBar(
      content: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.defaultSize,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Dimensions.defaultSize,
          ),
          boxShadow: [
            BoxShadow(
              color: RGB.success.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: Dimensions.defaultSize / 2,
            horizontal: 0,
          ),
          minLeadingWidth: Dimensions.defaultSize,
          leading: const Icon(
            Icons.check_circle,
            color: RGB.white,
          ),
          title: Text(
            text,
            style: const TextStyle(
              color: RGB.white,
              fontSize: Dimensions.defaultSize - 2,
            ),
          ),
        ),
      ),
      backgroundColor: RGB.success,
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.defaultSize),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(Keys.navigator.currentContext!).showSnackBar(snackBar);
  }
}
