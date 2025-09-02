import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:my_store/features/authentication/model/hotdealmodel.dart';
import 'package:my_store/features/shop/controllers/hot_deal_controller.dart';

class HotDealCardList extends StatelessWidget {
  HotDealCardList({super.key});

  final hotDealController = Get.put(HotDealController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: hotDealController.pageController,
            itemCount: hotDeals.length,
            itemBuilder: (context, index) {
              final deal = hotDeals[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DealCardUI(deal: deal),
              );
            },
          ),
        ),
      ],
    );
  }
}

class DealCardUI extends StatelessWidget {
  const DealCardUI({super.key, required this.deal});

  final HotDealModel deal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF5C7CFF), Color.fromARGB(255, 170, 188, 252)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(40),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// 📷 Image Section
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 6),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        deal.image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: -6,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "New 🔥",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// ℹ️ Info Section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 12, top: 12, bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      /// Title
                      Text(
                        deal.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 6),

                      /// Subtitle
                      Text(
                        deal.subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: Colors.white70,
                            ),
                      ),

                      /// Add spacing to push Price & Button to bottom
                      const SizedBox(height: 20),

                      /// Price + Buy Button Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Price Section
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "\$${deal.price}",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "\$${deal.oldPrice}",
                                style: const TextStyle(
                                  color: Colors.white60,
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),

                          /// Buy Now Button
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text("Buy Now", style: TextStyle(fontSize: 13)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        /// 🔥 Fire Icon Shimmer
        Positioned(
          top: 0,
          right: 0,
          child: Shimmer.fromColors(
            baseColor: Colors.redAccent,
            highlightColor: Colors.yellow,
            child: const Icon(
              Icons.local_fire_department_rounded,
              color: Colors.red,
              size: 36,
            ),
          ),
        ),
      ],
    );
  }
}
