import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/common/widgets/appbar/appbar.dart';
import 'package:my_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:my_store/common/widgets/layouts/grid_layout.dart';
import 'package:my_store/common/widgets/products/cart_icon.dart';
import 'package:my_store/common/widgets/products/hot_deal_card.dart';
import 'package:my_store/common/widgets/products/product_cards/card_vertical.dart';
import 'package:my_store/common/widgets/texts/section_heading.dart';
import 'package:my_store/features/shop/controllers/flashtimecontroller.dart';
import 'package:my_store/features/shop/controllers/product_filter.dart';
import 'package:my_store/features/shop/screens/home/widgets/category_item.dart';
import 'package:my_store/features/shop/screens/home/widgets/flash_timer.dart';
import 'package:my_store/features/shop/screens/home/widgets/payment_scroll.dart';
import 'package:my_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/product_list.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final flashSaleController = Get.put(FlashSaleController());
    final filterController = Get.put(ProductFilterController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Area with Ad Box and Categories
            TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Flash Sale Ad + Timer Row using GetX
                  // Flash Sale Ad + Timer Row with smooth color transition
                  FlashSaleTimer(flashSaleController: flashSaleController),

                  const SizedBox(height: TSizes.spaceBtwSections),
                  HotDealCardList(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            // Carousel Slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  TSizes.xs),
              child: PromoSlider(
                banners: [
                  TImages.banner2,
                  TImages.promoBanner2,
                  TImages.banner1,
                  TImages.banner3,
                  TImages.banner4,
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),
            // Popular Categories Title
            PoCategoryItem(),

            SizedBox(height: TSizes.spaceBtwItems),

            Padding(
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
            ),

            SizedBox(height: TSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.spaceBtwItems,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filter Products',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      // color: TColors.grey,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Choose brand',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems ),

            // Filter Chips
            Obx(() {
              final allFilters = [
                'All',
                'Nike',
                'Adidas',
                'Puma',
                'Reebok',
                'Sprt',
                'HomeStyle',
                'Ego',
                'ErgoComfort',
                'Apple',
                'UrbanWear',
                'Acer',
                'Bata',
              ];

              final visibleFilters =
                  filterController.showAllFilters.value
                      ? allFilters
                      : allFilters.sublist(0, 3); // Show only 5 initially

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.spaceBtwItems,
                ),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ...visibleFilters.map((filter) {
                      final isSelected =
                          filterController.selectedFilter.value == filter;
                      return ChoiceChip(
                        label: Text(filter),
                        selected: isSelected,
                        onSelected: (_) => filterController.setFilter(filter),
                        selectedColor: TColors.primary,
                        backgroundColor: Colors.grey.shade100,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    }),

                    // Show More/Less Toggle
                    GestureDetector(
                      onTap: filterController.toggleShowAll,
                      child: Chip(
                        label: Icon(
                          filterController.showAllFilters.value
                              ? Icons.expand_less
                              : Icons.expand_circle_down,
                          size: 20,
                          color: TColors.primary,
                        ),
                        backgroundColor: Colors.transparent,
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: TColors.primary.withAlpha((0.3*255).round()),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: TSizes.spaceBtwSections),

            // 2. Filter Product List Based on Selected Filter
            Obx(() {
              final selected = filterController.selectedFilter.value;
              final filteredProducts =
                  popularProducts.where((product) {
                    return selected == 'All' || product['brand'] == selected;
                  }).toList();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Popular Products Header
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.spaceBtwItems),
                    child: TSectionHeading(
                      title: 'Popular Products',
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Product Grid or Empty State
                  Padding(
                    padding: const EdgeInsets.all(TSizes.spaceBtwItems),
                    child:
                        filteredProducts.isEmpty
                            ? SizedBox(
                              width: double.infinity,
                              height: 400, // Increased for more space
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // 🔄 Larger Lottie Animation
                                    Lottie.asset(
                                      TImages.emptyResults,
                                      width: 200, // ⬆️ Increased size
                                      repeat: false,
                                    ),
                                    const SizedBox(height: 16),

                                    // Main Text
                                    Text(
                                      'No products found',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge!.copyWith(
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    // ✨ Animated Subtext
                                    AnimatedTextKit(
                                      repeatForever: true,
                                      animatedTexts: [
                                        TyperAnimatedText(
                                          'Try a different brand or reset filter.',
                                          // duration: const Duration(seconds: 4),
                                          textStyle: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                      isRepeatingAnimation: true,
                                      pause: const Duration(milliseconds: 1000),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            : TGridLayout(
                              itemCount: filteredProducts.length,
                              itemBuilder: (_, index) {
                                final product = filteredProducts[index];
                                return TProductCardVertical(
                                  image: product['image']!,
                                  brand: product['brand']!,
                                  title: product['title']!,
                                );
                              },
                            ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: TColors.grey),
          ),
          Text(
            TTexts.homeAppbarSubTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: TColors.white),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: TColors.white),
          onPressed: () {}, // Add search behavior here if needed
        ),
        TCartCounterIcon(onPressed: () {}, iconColor: TColors.white),
      ],
    );
  }
}
