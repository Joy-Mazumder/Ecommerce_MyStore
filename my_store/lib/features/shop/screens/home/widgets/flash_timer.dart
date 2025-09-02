import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:my_store/features/shop/controllers/flashtimecontroller.dart';
import 'package:my_store/utils/constants/sizes.dart';

class FlashSaleTimer extends StatelessWidget {
  const FlashSaleTimer({
    super.key,
    required this.flashSaleController,
  });

  final FlashSaleController flashSaleController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
      ),
      child: Row(
        children: [
          // Left Container: Offer Box
          Expanded(
            child: Container(
              height: 70,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 91, 118, 254),
                    Colors.lightBlue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withAlpha(
                      (0.41 * 255).round(),
                    ),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.local_offer,
                    color: Colors.yellow,
                    size: 26,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "20% OFF\nFirst Order",
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.apply(
                        color: Colors.white,
                        fontWeightDelta: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    
          // Right Container: Countdown Timer Box
          Expanded(
            child: Container(
              height: 70,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(left: 6),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.lightBlue, Color.fromARGB(255, 91, 118, 254)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withAlpha(
                      (0.41 * 255).round(),
                    ),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Ends In",
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      flashSaleController.formatDuration(),
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.apply(
                        color: Colors.white,
                        fontWeightDelta: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

