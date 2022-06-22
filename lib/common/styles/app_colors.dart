import 'package:flutter/material.dart';

/// Parse hex color from string
class _HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  _HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class AppColors {
  static Color primary = _HexColor('383838');
  static Color background = _HexColor('2b2b2b');
}
