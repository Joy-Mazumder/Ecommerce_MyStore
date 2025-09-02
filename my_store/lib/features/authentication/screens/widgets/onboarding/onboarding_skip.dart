import 'package:flutter/material.dart';
import 'package:my_store/features/shop/controllers/controllers.onboarding/onboarding_controller.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(onPressed: OnBoardingController.instance.skipPage, child: Text("Skip")),
    );
  }
}
