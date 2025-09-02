import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      'image': TImages.wishlist1,
      'title': 'Floral Lace Elegance',
      'subtitle': 'Bloom with elegance.',
      'price': 16.00,
      'colors': [Color(0xFFF49DA7), Color(0xFF562B20), Color(0xFF3B2F2F)],
    },
    {
      'image': TImages.wishlist2,
      'title': 'Sleek Satin Glamour',
      'subtitle': 'Satin, sleek, glamorous.',
      'price': 12.00,
      'colors': [Color(0xFFC6C2B6), Color(0xFF6B6B6B), Color(0xFF3B3B3B)],
    },
    {
      'image': TImages.wishlist3,
      'title': 'Timeless Glam Look',
      'subtitle': 'Radiate timeless glam.',
      'price': 10.00,
      'colors': [Color(0xFF363960), Color(0xFF262A39), Color(0xFF1E1F24)],
    },
    {
      'image': TImages.wishlist4,
      'title': 'Floral Lace Elegance',
      'subtitle': 'Graceful. Sleek. Stunning.',
      'price': 14.00,
      'colors': [Color(0xFFF49DA7), Color(0xFF562B20), Color(0xFF3B2F2F)],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.04;
    final fontScale = size.width * 0.04;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 225, 216),
              Color.fromARGB(255, 255, 169, 154),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // AppBar
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padding,
                  vertical: size.height * 0.015,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Wishlist',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontScale + 4,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          // margin: EdgeInsets.only(right: padding / 2),
                          padding: EdgeInsets.all(size.width * 0.025),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Iconsax.notification,
                                color: Colors.black,
                              ),
                              SizedBox(width: size.width * 0.036),
                              const Icon(
                                Iconsax.shopping_cart,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Body List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(padding),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final imageHeight = size.height * 0.2;
                    final imageWidth = size.width * 0.4;

                    return Container(
                      margin: EdgeInsets.only(bottom: padding),
                      padding: EdgeInsets.only(
                        top: padding * 0.48,
                        right: padding * 0.48,
                        left: padding * 0.48,
                        bottom: 0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipPath(
                                clipper: BottomCurveClipper(
                                  size: Size(imageWidth, imageHeight),
                                ),
                                child: Container(
                                  height: imageHeight,
                                  width: imageWidth,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue[100],
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(item['image']),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topLeft,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: size.height * 0.014,
                                left: imageWidth * 0.3,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color:
                                              TColors
                                                  .darkGrey, // Change this to desired border color
                                          width: 1.5,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: size.height * 0.0028,
                                        horizontal: size.width * 0.0068,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: size.width * 0.066,
                                            height: size.width * 0.0688,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFFF725E),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Iconsax.shopping_bag,
                                              size: size.width * 0.038,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: size.width * 0.008),
                                          Text(
                                            "Shop",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: size.width * 0.03,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(width: size.width * 0.002),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: size.width * 0.012),
                                    Container(
                                      width: size.width * 0.09,
                                      height: size.width * 0.1,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: TColors.darkGrey,
                                          width: 1,
                                        ),
                                      ),
                                      child: const Icon(
                                        Iconsax.heart5,
                                        size: 14,
                                        color: Color(0xFFFF725E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: padding),

                          // Product Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4.8),
                                Text(
                                  item['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: fontScale + 0.4,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.004),
                                Text(
                                  item['subtitle'],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: fontScale * 0.9,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: size.height * 0.008),
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: fontScale + 1.2,
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.06),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${item['price'].toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: fontScale + 2.4,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: size.width * 0.02),
                                    SizedBox(
                                      width: size.width * 0.15,
                                      height: size.width * 0.06,
                                      child: Stack(
                                        children: List.generate(
                                          item['colors'].length,
                                          (colorIndex) => Positioned(
                                            left: colorIndex * 12,
                                            child: Container(
                                              width: size.width * 0.046,
                                              height: size.width * 0.046,
                                              decoration: BoxDecoration(
                                                color:
                                                    item['colors'][colorIndex],
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  final Size size;

  BottomCurveClipper({required this.size});

  @override
  Path getClip(Size _) {
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
      size.width * 0.01,
      size.height - 18,
      size.width * 0.04,
      size.height - 14,
    );
    path.quadraticBezierTo(
      size.width * 0.06,
      size.height - 12,
      size.width * 0.1,
      size.height - 10,
    );
    path.lineTo(size.width * 0.18, size.height - 10);
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height - 11,
      size.width * 0.22,
      size.height - 13,
    );
    path.quadraticBezierTo(
      size.width * 0.24,
      size.height - 15,
      size.width * 0.25,
      size.height - 18,
    );
    path.quadraticBezierTo(
      size.width * 0.26,
      size.height - 20,
      size.width * 0.28,
      size.height * 0.8,
    );
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.7,
      size.width * 0.4,
      size.height * 0.7,
    );
    path.lineTo(size.width * 0.96, size.height * 0.7);
    path.quadraticBezierTo(
      size.width,
      size.height * 0.68,
      size.width,
      size.height * 0.66,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
