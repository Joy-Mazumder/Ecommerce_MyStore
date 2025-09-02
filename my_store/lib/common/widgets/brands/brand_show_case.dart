import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:my_store/common/widgets/products/brand_card.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(TSizes.md),
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with products count
          TBrandCard(showBorder: false, brndName: 'Nikee',),
          SizedBox(height: TSizes.spaceBtwItems,),

          /// Brand top 3 products Images
          Row(
            children:
                images
                    .map((image) => brandTopProductImageWidget(image, context))
                    .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor:
            THelperFunctions.isDarkMode(context)
                ? TColors.darkerGrey
                : TColors.light,
        margin: EdgeInsets.only(right: TSizes.sm),
        padding: EdgeInsets.all(TSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
