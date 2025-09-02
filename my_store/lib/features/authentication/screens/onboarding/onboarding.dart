import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:my_store/features/shop/controllers/controllers.onboarding/onboarding_controller.dart';
import 'package:my_store/features/authentication/screens/widgets/onboarding/onboarding_dot_navigation.dart';
import 'package:my_store/features/authentication/screens/widgets/onboarding/onboarding_next_button.dart';
import 'package:my_store/features/authentication/screens/widgets/onboarding/onboarding_page.dart';
import 'package:my_store/features/authentication/screens/widgets/onboarding/onboarding_skip.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Horizontal scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                title: TTexts.onBoardingTitle1,
                image: TImages.onBoardingImage1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingTitle2,
                image: TImages.onBoardingImage2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingTitle3,
                image: TImages.onBoardingImage3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // Skip Button
          OnBoardingSkip(),

          // Dot navigation smooth page indicator
          OnBoardingDotNavigation(),

          // Circular Button
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}
