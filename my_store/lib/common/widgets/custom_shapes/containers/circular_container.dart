import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding,
    this.child,
    this.backgroundColor = TColors.white,
    this.margin, this.opacity = true,
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;
  final bool opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: opacity ? backgroundColor.withAlpha((0.1 * 255).round()) : backgroundColor,
       
      ),
    );
  }
}
