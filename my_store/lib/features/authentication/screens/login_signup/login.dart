import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:my_store/common/style/spacing_styles.dart';
import 'package:my_store/common/widgets/login_signup/form_divider.dart';
import 'package:my_store/common/widgets/login_signup/social_buttons.dart';
import 'package:my_store/features/authentication/screens/widgets/login_signup/login_form.dart';
import 'package:my_store/features/authentication/screens/widgets/login_signup/login_header.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              TLoginHeader(),

              TLoginForm(),

              // Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              
              SizedBox(height: TSizes.spaceBtwItems),

              // footer
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

