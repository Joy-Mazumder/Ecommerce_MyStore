import 'package:my_store/utils/constants/image_strings.dart';

class HotDealModel {
  final String image;
  final String title;
  final String subtitle;
  final double price;
  final double oldPrice;

  HotDealModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.oldPrice,
  });
}


final hotDeals = [
  HotDealModel(
    image: TImages.productImage7,
    title: "Nike Air Jordan",
    subtitle: "Limited Time Offer - 25% OFF",
    price: 149,
    oldPrice: 199,
  ),
  HotDealModel(
    image: TImages.productImage52,
    title: "iPhone 14 Pro",
    subtitle: "Hot Sale - Save \$200 Today",
    price: 999,
    oldPrice: 1199,
  ),
  HotDealModel(
    image: TImages.productImage64,
    title: "Leather Jacket",
    subtitle: "Stay Warm & Stylish - 40% OFF",
    price: 89,
    oldPrice: 149,
  ),
  HotDealModel(
    image: TImages.productImage39,
    title: "Ergo Office Chair",
    subtitle: "Comfort + Support - 30% OFF",
    price: 109,
    oldPrice: 159,
  ),
];
