import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class HotDealController extends GetxController {
  final pageController = PageController(viewportFraction: 0.92);
  final currentPage = 0.obs;

  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (pageController.hasClients) {
        currentPage.value = (currentPage.value + 1) % 4;
        pageController.animateToPage(
          currentPage.value,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    _timer.cancel();
    super.onClose();
  }
}
