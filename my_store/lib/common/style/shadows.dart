import 'package:flutter/cupertino.dart';
import 'package:my_store/utils/constants/colors.dart';

class TShadowStyle {
  
  static final verticalProductShadow = BoxShadow(
    color: TColors.darkGrey.withAlpha((255 * 0.1).round()),
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: TColors.darkGrey.withAlpha((255 * 0.1).round()),
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(0, 2),
  );

}
