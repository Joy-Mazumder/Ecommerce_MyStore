import 'package:flutter/material.dart';
import 'package:my_store/features/shop/screens/home/widgets/payment_scroll.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Available Payment Methods",
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 8),
          PaymentMethodsList(),
        ],
      ),
    );
  }
}

