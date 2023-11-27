import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextStyleStorage {
  static TextStyle titleMedium = const TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
    fontSize: 18,
    letterSpacing: 1.0,
    fontFamily: 'Helvetica',
  );
  static TextStyle bodyMedium = const TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    letterSpacing: 1.0,
    fontFamily: 'Helvetica',
  );
  static TextStyle bodySmall = const TextStyle(
    color: Colors.black,
    fontSize: 10.0,
    letterSpacing: 0.8,
    fontFamily: 'Helvetica',
  );
  static TextStyle labelSmall = const TextStyle(
    color: Colors.black,
    fontSize: 9.0,
    letterSpacing: 0.6,
    fontFamily: 'Helvetica',
  );
}
