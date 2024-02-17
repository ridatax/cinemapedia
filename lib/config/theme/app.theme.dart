import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color.fromRGBO(0,102, 153,1),
      secondaryHeaderColor:const Color.fromRGBO(131, 151, 136,0.8),
      colorSchemeSeed: const Color.fromRGBO(0,102, 153,1));
}
