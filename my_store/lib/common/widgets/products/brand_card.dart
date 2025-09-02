import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:my_store/common/widgets/images/circular_image.dart';
import 'package:my_store/common/widgets/texts/brnd_ttl_txt_verified_icn.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/enums.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.productImage = TImages.clothIcon,
    this.onTap, required this.brndName,
  });

  final bool showBorder;
  final String brndName;
  final String productImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        // borderColor: Colors.red,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // --- Icon ---
            Flexible(
              child: TCircularImage(
                isNetworkImage: false,
                image: productImage,
                backgroundColor: Colors.transparent,
                overLayColor:
                    THelperFunctions.isDarkMode(context)
                        ? TColors.white
                        : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 3),

            /// --- Text ---
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(
                    title: brndName,
                    brandTextSize: TTextSizes.large,
                  ),
                  Text(
                    '256 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
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
