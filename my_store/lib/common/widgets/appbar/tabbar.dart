import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/device/device_utility.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  // If you want to add the background color to tabs you have to wrap them in Material widget.
  // You do not need [PreferredSize] widget and that's why created custom class. [PreferredSizeWidget]
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
        // padding: EdgeInsets.zero,
        // labelPadding: EdgeInsets.symmetric(horizontal: 16),
        // indicatorPadding: EdgeInsets.zero,
        isScrollable: true,
        tabs: tabs,
        indicatorColor: TColors.primary,
        labelColor: dark ? TColors.white : TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
