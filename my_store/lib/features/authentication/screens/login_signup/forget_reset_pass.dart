import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/login_signup/success_screen.dart';
import 'package:my_store/features/authentication/screens/login_signup/login.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';

class ForgetResetPass extends StatelessWidget {
  const ForgetResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(
              TTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Text(
              TTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              // textAlign: TextAlign.center,
            ),
            SizedBox(height: TSizes.spaceBtwSections * 2),

            TextFormField(
              decoration: InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(
                    () => SuccessScreen(
                      image: TImages.deliveredEmailIllustration,
                      title: TTexts.changeYourPasswordTitle,
                      subTitle: TTexts.changeYourPasswordSubTitle,
                      onPressed: () {
                        Get.off(() => LoginScreen());
                      },
                      buttnText: TTexts.done,
                      extraButton: TextButton(
                        onPressed: () {},
                        child: Text(TTexts.resendEmail),
                      ),
                    ),
                  );
                },
                child: Text(TTexts.tContinue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
