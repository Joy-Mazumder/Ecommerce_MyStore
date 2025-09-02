import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/appbar/appbar.dart';
import 'package:my_store/common/widgets/images/circular_image.dart';
import 'package:my_store/common/widgets/texts/section_heading.dart';
import 'package:my_store/features/personalization/screens/profile/profile_menu.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark
              ? null
              : const LinearGradient(
                  colors: [Color(0xFFFFFBEA), Color(0xFFFFF1D6)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.035,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TAppBar(title: const Text('Profile'), showBackArrow: true),
                const SizedBox(height: TSizes.spaceBtwSections),

                _buildHeaderCard(context, size, isDark),
                const SizedBox(height: TSizes.spaceBtwSections),

                _buildProfileCompletionBar(context),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Saved Address + Referral
                _buildTileGroup(context, children: [
                  TProfileMenu(
                    title: 'Add Address',
                    value: '2 addresses added',
                    icon: const Icon(Iconsax.location, size: 18),
                    onPressed: () {},
                  ),
                  TProfileMenu(
                    title: 'Referral Code',
                    value: 'JOY123',
                    icon: const Icon(Iconsax.tag, size: 18),
                    onPressed: () {},
                  ),
                ]),

                const SizedBox(height: TSizes.spaceBtwSections),
                const TSectionHeading(title: 'Profile Information', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                _buildTileGroup(context, children: [
                  TProfileMenu(title: 'Name', value: 'Joy Mazumder', onPressed: () {}),
                  TProfileMenu(title: 'Username', value: 'joy82_t', onPressed: () {}),
                ]),

                const SizedBox(height: TSizes.spaceBtwSections),
                const TSectionHeading(title: 'Personal Information', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                _buildTileGroup(context, children: [
                  TProfileMenu(title: 'User ID', value: '45689', icon: const Icon(Iconsax.copy, size: 18), onPressed: () {}),
                  TProfileMenu(title: 'E-mail', value: 'joy..4.@gmail.com', onPressed: () {}),
                  TProfileMenu(title: 'Phone', value: '+92-428-8059528', onPressed: () {}),
                  TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
                  TProfileMenu(title: 'Date of Birth', value: '10 Oct, 1994', onPressed: () {}),
                ]),

                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(thickness: 1),
                const SizedBox(height: TSizes.spaceBtwItems),

                Center(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Iconsax.trash, color: Colors.red, size: 18),
                    label: const Text('Close Account', style: TextStyle(color: Colors.red)),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Header with Points
  Widget _buildHeaderCard(BuildContext context, Size size, bool isDark) {
    return Container(
      padding: EdgeInsets.all(size.width * 0.045),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: isDark ? const Color(0xFF2D2B25) : const Color.fromARGB(255, 255, 236, 162),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withAlpha((0.05*255).round()),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
        ],
      ),
      child: Column(
        children: [
          const TCircularImage(image: TImages.user, width: 70, height: 70),
          const SizedBox(height: 10),
          Text('Welcome, Joy', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withAlpha((0.1*255).round()),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: const [
                    Icon(Iconsax.crown_1, size: 18, color: Colors.deepPurple),
                    SizedBox(width: 6),
                    Text("1200 Points", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () => _showMyIDSheet(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: TColors.primary),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: const [
                      Icon(Iconsax.scan_barcode, size: 18),
                      // SizedBox(width: 6),
                      // Text("", style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionTile(context, icon: Icons.shopping_cart_outlined, label: 'Orders', bg: Colors.deepPurpleAccent),
              _buildActionTile(context, icon: Iconsax.activity, label: 'Statistic', bg: Colors.teal),
              _buildActionTile(context, icon: Iconsax.more_square, label: 'More', bg: Colors.redAccent),
            ],
          ),
        ],
      ),
    );
  }

  /// Complete Profile Bar with Tween Animation
  Widget _buildProfileCompletionBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          if (!THelperFunctions.isDarkMode(context))
            BoxShadow(
              color: TColors.darkGrey.withAlpha((0.04*255).round()),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Iconsax.user_edit, size: 20, color: Colors.teal),
              SizedBox(width: 8),
              Text("Complete Your Profile", style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 12),

          /// Progress Bar Animated
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 0.8),
            duration: const Duration(seconds: 2),
            builder: (context, value, child) {
              return Stack(
                alignment: Alignment.centerRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: LinearProgressIndicator(
                      value: value,
                      minHeight: 12,
                      backgroundColor: Colors.teal.shade100.withAlpha((0.3*255).round()),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.teal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text("${(value * 100).round()}%",
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile(BuildContext context, {required IconData icon, required String label, required Color bg}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bg.withAlpha((0.12*255).round()),
          ),
          child: Icon(icon, color: bg, size: 22),
        ),
        const SizedBox(height: 6),
        Text(label, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }

  Widget _buildTileGroup(BuildContext context, {required List<Widget> children}) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: TColors.darkGrey.withAlpha((0.04*255).round()),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(children: children),
    );
  }

  void _showMyIDSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Scan QR ID", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22)),
              const SizedBox(height: 20),
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: TColors.light,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: TColors.darkGrey.withAlpha(51)),
                ),
                child: const Center(
                  child: Icon(Icons.qr_code_2, size: 140, color: TColors.primary),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Iconsax.export_3),
                label: const Text("Share ID"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
