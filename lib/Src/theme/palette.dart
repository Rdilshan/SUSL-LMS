import 'package:flutter/material.dart';
class Palette {
  static const MaterialColor appBrown = const MaterialColor(
    0xFF4D0C04, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xFF4D0C04),//10%
      100: const Color(0xFF4D0C04),//20%
      200: const Color(0xFF4D0C04),//30%
      300: const Color(0xFF4D0C04),//40%
      400: const Color(0xFF4D0C04),//50%
      500: const Color(0xFF4D0C04),//60%
      600: const Color(0xFF4D0C04),//70%
      700: const Color(0xFF4D0C04),//80%
      800: const Color(0xFF4D0C04),//90%
      900: const Color(0xFF4D0C04),//100%
    },
  );
} // you can define define int 500 as the default shade and add your lighter tints above and darker tints below.