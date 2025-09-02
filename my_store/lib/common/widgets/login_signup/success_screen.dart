import 'package:flutter/material.dart';
import 'package:my_store/common/style/spacing_styles.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed, this.buttnText = TTexts.tContinue, this.extraButton,
  });

  final String image, title, subTitle, buttnText;
  final VoidCallback onPressed;
  final Widget? extraButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: TSizes.spaceBtwItems),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    onPressed();
                  },
                  child: Text(buttnText),
                ),
              ),
              // SizedBox(height: TSizes.spaceBtwItems),

              if (extraButton != null) ...[
                SizedBox(height: TSizes.spaceBtwItems),
                extraButton!, // ✅ Show only if provided
              ],
            ],
          ),
        ),
      ),
    );
  }
}
