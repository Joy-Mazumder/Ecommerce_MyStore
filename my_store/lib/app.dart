import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:my_store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: OnBoardingScreen(),
    );
  }
}