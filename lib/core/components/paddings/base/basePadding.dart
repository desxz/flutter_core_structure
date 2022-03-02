import 'package:flutter/material.dart';

class BasePadding extends EdgeInsets {
  const BasePadding.vertical() : super.symmetric(vertical: 20);
  const BasePadding.horizontal() : super.symmetric(horizontal: 20);
  const BasePadding.small() : super.all(8);
  const BasePadding.medium() : super.all(16);
  const BasePadding.large() : super.all(20);
  const BasePadding.xlarge() : super.all(28);
}
