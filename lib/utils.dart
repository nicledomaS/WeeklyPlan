import 'dart:ui';

import 'package:flutter/cupertino.dart';

bool isFirstColumn(int index, int rowsCount) => ((index + 1) % rowsCount) == 1;
bool isLastColumn(int index, int rowsCount) => ((index + 1) % rowsCount) == 0;

Size calcTextSize(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout();
  return textPainter.size;
}