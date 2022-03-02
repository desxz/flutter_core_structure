import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? color;
  BoxShape? shape;
  final List<BoxShadow>? shadow;

  DefaultButton(
      {Key? key,
      this.onPressed,
      required this.child,
      this.width,
      this.height,
      this.borderRadius,
      this.color,
      this.shadow,
      this.shape = BoxShape.rectangle})
      : super(key: key);

  final defaultShadow = <BoxShadow>[
    const BoxShadow(
      color: Colors.black26,
      blurRadius: 1.5,
      spreadRadius: 1.5,
      offset: Offset(1, 1.5),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: shape == BoxShape.circle
              ? null
              : BorderRadius.circular(borderRadius ?? 0),
          boxShadow: shadow ?? defaultShadow,
          shape: shape!,
        ),
        width: width,
        height: shape == BoxShape.circle ? width : height,
        child: child,
      ),
    );
  }
}
