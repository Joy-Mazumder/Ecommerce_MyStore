import 'package:get/get.dart';
import 'dart:async';

class FlashSaleController extends GetxController {
  var duration = const Duration(hours: 1, minutes: 23, seconds: 45).obs;
  Timer? _timer;

  @override
  void onInit() {
    _startCountdown();
    super.onInit();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (duration.value.inSeconds > 0) {
        duration.value = duration.value - const Duration(seconds: 1);
      } else {
        _timer?.cancel();
      }
    });
  }

  String formatDuration() {
    final d = duration.value;
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inHours)}:${twoDigits(d.inMinutes % 60)}:${twoDigits(d.inSeconds % 60)}";
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
