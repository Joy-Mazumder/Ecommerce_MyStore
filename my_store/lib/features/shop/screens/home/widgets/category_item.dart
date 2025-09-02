import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/custom_shapes/image_text/vertical_image_text.dart';
import 'package:my_store/common/widgets/texts/section_heading.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class PoCategoryItem extends StatelessWidget {
  const PoCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final List<Map<String, String>> popularCategories = [
      {'image': TImages.sportIcon, 'title': 'Sports'},
      {'image': TImages.clothIcon, 'title': 'Clothing'},
      {'image': TImages.shoeIcon, 'title': 'Shoes'},
      {'image': TImages.cosmeticsIcon, 'title': 'Cosmetics'},
      {'image': TImages.animalIcon, 'title': 'Pets'},
      {'image': TImages.toyIcon, 'title': 'Toys'},
      {'image': TImages.furnitureIcon, 'title': 'Furniture'},
      {'image': TImages.jeweleryIcon, 'title': 'Jewelry'},
      {'image': TImages.electronicsIcon, 'title': 'Electronics'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItems),
          child: TSectionHeading(
            title: 'Popular Categories',
            showActionButton: false,
            textColor: dark  ?  TColors.white : TColors.textPrimary,
          ),
        ),

        const SizedBox(height: TSizes.spaceBtwItems),

        // Scrollable Category Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItems),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 3.2),
            decoration: BoxDecoration(
              color: dark ? Colors.white.withAlpha((0.16 * 255).round()) : TColors.darkerGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                itemCount: popularCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final category = popularCategories[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TVerticalImageText(
                      image: category['image']!,
                      title: category['title']!,
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
