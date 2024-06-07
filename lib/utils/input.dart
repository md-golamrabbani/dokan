import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

inputStyle({
  bool isPrefixIconSvg = false,
  IconData? prefixIcon,
  String? svgPrefixIcon,
  double? svgPrefixIconSize,
  IconData? suffixIcon,
  VoidCallback? suffixOnPressed,
  String? label,
  bool? passwordVisibility,
  EdgeInsets? contentPadding,
  double? borderWidth,
  Color? borderColor,
  required String hintText,
}) {
  return InputDecoration(
    label: label != null ? Text(label) : null,
    prefixIcon: prefixIcon != null
        ? isPrefixIconSvg == false
            ? Icon(
                prefixIcon,
                size: Dimensions.lgSize,
              )
            : Container(
                alignment: Alignment.centerRight,
                width: 40,
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.smSize,
                ),
                child: SvgPicture.asset(
                  svgPrefixIcon!,
                  width: svgPrefixIconSize ?? Dimensions.defaultSize * 1.25,
                  height: svgPrefixIconSize ?? Dimensions.defaultSize * 1.25,
                ),
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
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: borderWidth ?? 1,
        color: borderColor ?? RGB.muted,
      ),
    ),
    hintText: hintText,
    fillColor: RGB.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusSize - 2),
      borderSide: BorderSide(
        color: borderColor ?? RGB.border,
        width: borderWidth ?? 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusSize - 2),
      borderSide: BorderSide(
        color: borderColor ?? RGB.border,
        width: borderWidth ?? 1,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusSize - 2),
      borderSide: BorderSide(
        color: borderColor ?? RGB.muted,
        width: borderWidth ?? 1,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusSize - 2),
      borderSide: BorderSide(
        color: borderColor ?? RGB.muted,
        width: borderWidth ?? 1,
      ),
    ),
    contentPadding: contentPadding ??
        const EdgeInsets.all(
          Dimensions.defaultSize / 1.25,
        ),
    counterText: '',
  );
}
