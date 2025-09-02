import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/appbar/appbar.dart';
import 'package:my_store/common/widgets/appbar/tabbar.dart';
import 'package:my_store/common/widgets/brands/brand_show_case.dart';
import 'package:my_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:my_store/common/widgets/layouts/grid_layout.dart';
import 'package:my_store/common/widgets/products/brand_card.dart';
import 'package:my_store/common/widgets/products/cart_icon.dart';
import 'package:my_store/common/widgets/texts/section_heading.dart';
import 'package:my_store/features/shop/screens/store/widgets/prenium_card.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/product_list.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
              iconColor:
                  THelperFunctions.isDarkMode(context)
                      ? TColors.white
                      : TColors.black,
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor:
                    THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                expandedHeight: 360,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSearchContainer(
                          text: 'Search in Store',
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 2.5),

                        PremiumCard(
                          productName: 'iphone-12',
                          brandName: 'Apple',
                          imageUrl: TImages.productImage72,
                          price: 1000,
                          originalPrice: 2000,
                          discountStart: DateTime(2025, 7, 7, 11, 30),
                          discountEnd: DateTime(2025, 7, 8, 11, 40),
                        ),
                      ],
                    ),
                  ),
                ),
                bottom: TTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              _StoreTabContent(),
              _StoreTabContent(),
              _StoreTabContent(),
              _StoreTabContent(),
              _StoreTabContent(),
            ],
          ),
        ),

        /// Floating CTA Banner
        floatingActionButton: const FloatingWithGlassmorphism(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class FloatingWithGlassmorphism extends StatelessWidget {
  const FloatingWithGlassmorphism({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha((0.2*255).round()),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withAlpha((0.3*255).round())),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.1*255).round()),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: const [
              Icon(Icons.local_offer_outlined, color: Colors.white),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  '🔥 Get 20% off on Top Brands!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StoreTabContent extends StatelessWidget {
  const _StoreTabContent();

  @override
  Widget build(BuildContext context) {
    final firstTwoBrands = popularProducts.sublist(6, 8);

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSectionHeading(title: 'Featured Brands', onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwItems / 1.5),
              TGridLayout(
                itemCount: firstTwoBrands.length,
                mainAxisExtent: 80,
                itemBuilder: (_, index) {
                  final brand = firstTwoBrands[index];
                  return TBrandCard(
                    showBorder: true,
                    productImage: brand['image'] ?? TImages.clothIcon,
                    brndName: brand['brand'] ?? 'Brand',
                  );
                },
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 1.5),
              const TBrandShowCase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3,
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
