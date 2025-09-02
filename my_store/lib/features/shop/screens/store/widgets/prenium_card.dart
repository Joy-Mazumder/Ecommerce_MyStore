import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class PremiumCard extends StatelessWidget {
  final String productName;
  final String brandName;
  final String imageUrl;
  final double price;
  final double originalPrice;
  final DateTime discountStart;
  final DateTime discountEnd;

  const PremiumCard({
    super.key,
    required this.productName,
    required this.brandName,
    required this.imageUrl,
    required this.price,
    required this.originalPrice,
    required this.discountStart,
    required this.discountEnd,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final bgColor = isDark ? Colors.grey.shade900 : Colors.white;
    final subBgColor = isDark ? Colors.grey.shade800 : Colors.grey.shade100;
    final textColor = isDark ? Colors.white : Colors.black87;
    final priceColor = isDark ? Colors.greenAccent : Colors.green;

    final dateFormat = DateFormat('dd/MM/yyyy');
    final timeFormat = DateFormat('HH:mm');
    final duration = discountEnd.difference(discountStart);
    final durationString = '${duration.inHours}h ${duration.inMinutes % 60}m';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            color: isDark ? Colors.white10 : Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black26 : Colors.grey.withAlpha((0.15*255).round()),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top: Date, FLASH DEAL (centered), Time
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        dateFormat.format(discountStart),
                        style: TextStyle(
                          color: textColor.withAlpha((0.6*255).round()),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'FLASH DEAL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        timeFormat.format(discountStart),
                        style: TextStyle(
                          color: textColor.withAlpha((0.6*255).round()),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            
            //  Dotted Divider
            CustomPaint(
              painter: DottedLinePainter(
                color: isDark ? Colors.white24 : Colors.grey.shade400,
              ),
              child: const SizedBox(height: 1, width: double.infinity),
            ),
            SizedBox(height: 8,),
            // Brand - Image - Product
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      brandName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(imageUrl),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      productName,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 6),
            Text(
              'Discount Duration: $durationString',
              style: TextStyle(fontSize: 12, color: textColor.withAlpha((0.6*255).round())),
            ),
            const SizedBox(height: 12),

            // Bottom Dotted Divider
            CustomPaint(
              painter: DottedLinePainter(
                color: isDark ? Colors.white24 : Colors.grey.shade400,
              ),
              child: const SizedBox(height: 1, width: double.infinity),
            ),

            // Bottom: Price + Arrow
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Container(
                
                width: double.infinity,
                color: subBgColor,
                
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${price.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: priceColor,
                          ),
                        ),
                        Text(
                          '\$${originalPrice.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDark ? Colors.white10 : Colors.grey.shade300,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DottedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  DottedLinePainter({
    required this.color,
    this.dashWidth = 5,
    this.dashSpace = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    double startX = 0;
    final y = size.height / 2;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, y), Offset(startX + dashWidth, y), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
