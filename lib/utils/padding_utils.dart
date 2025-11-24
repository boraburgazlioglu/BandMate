import 'package:flutter/widgets.dart';

class AppPadding {
  // standard padding for general purpose
  static const EdgeInsets all10 = EdgeInsets.all(10);
  static const EdgeInsets all16 = EdgeInsets.all(16);
  static const EdgeInsets all20 = EdgeInsets.all(20);

  // horizontal padding
  static const EdgeInsets horizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets horizontal20 = EdgeInsets.symmetric(horizontal: 20);

  // vertical padding
  static const EdgeInsets vertical10 = EdgeInsets.symmetric(vertical: 10);
  static const EdgeInsets vertical16 = EdgeInsets.symmetric(vertical: 16);

  // padding for specific directions
  static const EdgeInsets top10 = EdgeInsets.only(top: 10);
  static const EdgeInsets bottom10 = EdgeInsets.only(bottom: 10);
  static const EdgeInsets left10 = EdgeInsets.only(left: 10);
  static const EdgeInsets right10 = EdgeInsets.only(right: 10);

  // default screen padding that will be used for app's general
  static const EdgeInsets screenPadding =
  EdgeInsets.symmetric(horizontal: 20, vertical: 12);
}
