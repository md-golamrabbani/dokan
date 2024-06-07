import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';

inputStyle({
  IconData? prefixIcon,
  IconData? suffixIcon,
  VoidCallback? suffixOnPressed,
  String? label,
  bool? passwordVisibility,
  required String hintText,
}) {
  return InputDecoration(
    label: label != null ? Text(label) : null,
    prefixIcon: prefixIcon != null
        ? Icon(
            prefixIcon,
            size: Dimensions.lgSize,
          )
        : null,
    suffixIcon: suffixOnPressed != null
        ? IconButton(
            onPressed: () {
              suffixOnPressed.call();
            },
            icon: passwordVisibility!
                ? const Icon(
                    Icons.visibility_outlined,
                    color: RGB.muted,
                  )
                : const Icon(
                    Icons.visibility_off_outlined,
                    color: RGB.muted,
                  ),
          )
        : suffixIcon != null
            ? Icon(suffixIcon)
            : null,
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: RGB.muted,
      ),
    ),
    hintText: hintText,
    fillColor: RGB.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusSize - 2),
      borderSide: const BorderSide(
        color: RGB.border,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusSize - 2),
      borderSide: const BorderSide(
        color: RGB.border,
        width: 1,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusSize - 2),
      borderSide: const BorderSide(
        color: RGB.muted,
        width: 1,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusSize - 2),
      borderSide: const BorderSide(
        color: RGB.muted,
        width: 1,
      ),
    ),
    contentPadding: const EdgeInsets.all(
      Dimensions.defaultSize / 1.25,
    ),
    counterText: '',
  );
}
