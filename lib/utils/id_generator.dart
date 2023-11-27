import 'dart:math';

import 'package:flutter/material.dart';

class IDGenerator {
  static Set<String> usedIds = {};
  IDGenerator();

  static String genID({int length = 10}) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    String randomId = '';

    do {
      randomId = String.fromCharCodes(
        List.generate(
          length,
          (index) => chars.codeUnitAt(random.nextInt(chars.length)),
        ),
      );
    } while (usedIds.contains(randomId));
    debugPrint(randomId);
    usedIds.add(randomId);
    return randomId;
  }
}
