import 'package:flutter/material.dart';

class CustomPageController extends PageController {
  @override
  Future<void> nextPage(
      {Duration duration = const Duration(seconds: 1),
      Curve curve = Curves.easeIn}) {
    return super.nextPage(duration: duration, curve: curve);
  }

  @override
  Future<void> previousPage(
      {Duration duration = const Duration(seconds: 1),
      Curve curve = Curves.easeOut}) {
    return super.previousPage(duration: duration, curve: curve);
  }
}
