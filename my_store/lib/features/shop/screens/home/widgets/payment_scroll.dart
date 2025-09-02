import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class PaymentMethodsList extends StatelessWidget {
  PaymentMethodsList({super.key});

  final List<Map<String, String>> methods = [
    {"icon": TImages.applePay, "label": "Apple Pay"},
    {"icon": TImages.googlePay, "label": "Google Pay"},
    {"icon": TImages.creditCard, "label": "Credit Card"},
    {"icon": TImages.masterCard, "label": "MasterCard"},
    {"icon": TImages.paypal, "label": "PayPal"},
    {"icon": TImages.visa, "label": "Visa"},
    {"icon": TImages.paystack, "label": "Paystack"},
    {"icon": TImages.paytm, "label": "Paytm"},
  ];

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: methods.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final method = methods[index];

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFdfe4ea), Color(0xFFced6e0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withAlpha((0.2*255).round()),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Image.asset(
                    method["icon"]!,
                    width: 34,
                    height: 34,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 72,
                child: Text(
                  method["label"]!,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: dark ? Colors.white70 : Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
