import 'package:dokan/utils/constant.dart';
import 'package:flutter/material.dart';

class FloatingButton {
  static Container show = Container(
    decoration: Constant.themeBoxDecoration,
    child: FloatingActionButton(
      elevation: 0,
      backgroundColor: Colors.transparent,
      onPressed: () {},
      child: const Icon(Icons.search),
    ),
  );
}
