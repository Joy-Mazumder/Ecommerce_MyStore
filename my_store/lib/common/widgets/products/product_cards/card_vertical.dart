import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/style/shadows.dart';
import 'package:my_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:my_store/common/widgets/icons/circular_icon.dart';
import 'package:my_store/common/widgets/images/rounded_image.dart';
import 'package:my_store/common/widgets/texts/price_text.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  final String image;
  final String brand;
  final String title;

  const TProductCardVertical({
    super.key,
    this.image = TImages.productImage1,
    this.brand = 'Nike',
    this.title = 'Green Nike Air Shoes',
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.grey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔳 Image + Tag + Favorite
            TRoundedContainer(
              height: 180,
              width: double.infinity,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : Colors.white60,
              child: Stack(
                children: [
                  TRoundedImage(imageUrl: image),
                  Positioned(
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withAlpha((255 * 0.8).round()),
                      padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm,
                        vertical: TSizes.xs,
                      ),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// 📝 Product Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: title, smallSize: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  /// Brand + Icon
                  Row(
                    children: [
                      Text(
                        brand,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
        decoration: TextDecoration.underline,
        decorationColor: Colors.grey,
        ),
                      ),
                      const SizedBox(width: TSizes.xs),
                      const Icon(
                        Iconsax.verify5,
                        color: TColors.primary,
                        size: TSizes.iconXs,
                      ),
                    ],
                  ),
                ],
              ),
            ),

// SizedBox(height: 2,),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(
                          "4.8",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "1.2k sold",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: Colors.grey),
                        ),
                      ],
              ),
            ),

            const Spacer(), 

            /// 💵 Price + Add Button
            Padding(
              padding: const EdgeInsets.only(left:TSizes.sm, ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TProductPriceText(price: '38.0'),
                  Container(
                    decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight: Radius.circular(TSizes.productImageRadius),
                      ),
                    ),
                    child: const SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(
                        child: Icon(Iconsax.add, color: TColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key,
    required this.title,
    required this.smallSize,
  });

  final String title;
  final bool smallSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelMedium
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: TextAlign.left,
    );
  }
}
