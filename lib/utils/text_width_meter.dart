import 'package:flutter/material.dart';

double textWidthMeter(String text, TextStyle style,
    {required double scaleFactor}) {
  var span = TextSpan(
    text: text,
    style: style,
  );
  var scaleFactor = 1.0;
  var tp = TextPainter(
    maxLines: 1,
    textAlign: TextAlign.left,
    textDirection: TextDirection.ltr,
    text: span,
    textScaleFactor: scaleFactor,
  );
  tp.layout();
  return tp.size.width;
}
