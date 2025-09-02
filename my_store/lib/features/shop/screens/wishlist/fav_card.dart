import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/image_strings.dart';

class FavProductCard extends StatelessWidget {
  const FavProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            // Left side with image and overlapping buttons
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    TImages.productImage20, // replace with your path
                    width: width * 0.35,
                    height: width * 0.35,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.lock, color: Colors.orange, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            "Shop",
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 12),
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.grey[200],
                            child: Icon(Icons.favorite_border, color: Colors.red, size: 16),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            // Right side with product info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Floral Lace Elegance",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Bloom with elegance.",
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(Icons.star, color: Colors.amber, size: 18),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$16.00",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            _buildColorDot(Colors.pink),
                            _buildColorDot(Colors.black),
                            _buildColorDot(Colors.brown),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildColorDot(Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}