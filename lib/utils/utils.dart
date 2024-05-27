import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static Color primaryColor = const Color.fromRGBO(58, 24, 5, 1);
  static Color getPrimaryColor(BuildContext context) =>
      Theme.of(context).colorScheme.primary;
}
