import 'package:flutter/material.dart';

class AppTextStyles {
  /// Font Weight Charts
  /// w100 = Thin
  /// w200 = Extra Light
  /// w300 = Light
  /// w400 = Normal (Regular)
  /// w500 = Medium
  /// w600 = Semi Bold
  /// w700 = Bold
  /// w800 = Extra Bold
  /// w900 = Black

  static const title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
  );

  static const heading1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );

  static const heading2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const heading3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.grey[300],
  );

  static TextStyle body2 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: Colors.grey[300],
  );
}
