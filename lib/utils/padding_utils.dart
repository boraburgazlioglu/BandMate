import 'package:flutter/material.dart';

/// standard paddings for use of app in general

class AppSpacing {
  // standard constants

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  // paddings for all directions

  /// 4.0
  static const EdgeInsets allXS = EdgeInsets.all(xs);

  /// 8.0
  static const EdgeInsets allSM = EdgeInsets.all(sm);

  /// 16.0
  static const EdgeInsets allMD = EdgeInsets.all(md);

  /// 24.0
  static const EdgeInsets allLG = EdgeInsets.all(lg);

  // paddings with specific directions

  /// horizontal-16.0
  static const EdgeInsets horizontalMD = EdgeInsets.symmetric(horizontal: md);

  /// horizontal 8.0
  static const EdgeInsets horizontalSM = EdgeInsets.symmetric(horizontal: sm);

  /// vertical 16.0
  static const EdgeInsets verticalMD = EdgeInsets.symmetric(vertical: md);

  /// vertical 8.0
  static const EdgeInsets verticalSM = EdgeInsets.symmetric(vertical: sm);

  // sizedbox - vertical

  /// vertical gap-8.0
  static const Widget verticalSpacerSM = SizedBox(height: sm);

  /// vertical gap-16.0
  static const Widget verticalSpacerMD = SizedBox(height: md);

  /// vertical gap-24.0
  static const Widget verticalSpacerLG = SizedBox(height: lg);

  /// vertical gap-32.0
  static const Widget verticalSpacerXL = SizedBox(height: xl);

  // sizedbox - horizontal

  /// horizontal gap-8.0
  static const Widget horizontalSpacerSM = SizedBox(width: sm);

  /// horizontal gap-16.0
  static const Widget horizontalSpacerMD = SizedBox(width: md);


  // main screen padding

  /// main padding - horizontal-16.0 - vertical-24.0 - for below appbar
  static const EdgeInsets screenPadding = EdgeInsets.fromLTRB(md, lg, md, md);
}