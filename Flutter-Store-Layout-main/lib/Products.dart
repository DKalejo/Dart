import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProductCard(
          imagePath: "assets/images/pizzaImg.png",
          title: "Food & Drink",
          subtitle: "+ \$ 2250 Today",
          amount: "391.254,01",
          percentage: "1.8 %",
          percentageColor: Color(0xFF2ba059),
        ),
        ProductCard(
          imagePath: "assets/images/tvImg.png",
          title: "Electronics",
          subtitle: "+ \$ 2250 Today",
          amount: "3.176.254,01",
          percentage: "43.6 %",
          percentageColor: Color(0xFF2ba059),
        ),
        ProductCard(
          imagePath: "assets/images/medicineImg.png",
          title: "Health",
          subtitle: "+ \$ 110 Today",
          amount: "38,01",
          percentage: "25.8 %",
          percentageColor: Color(0xFFF93839),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String amount;
  final String percentage;
  final Color percentageColor;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.percentage,
    required this.percentageColor,
  });

  @override
  Widget build(BuildContext context) {
    // split amount into integer and decimal parts
    final parts = amount.split(',');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? parts[1] : "00";

    // icon if percentage is positive or negative
    final bool isPositive = percentageColor == const Color(0xFFd3ecdd);
    final IconData arrowIcon = isPositive
        ? Icons.keyboard_arrow_up
        : Icons.keyboard_arrow_down;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Main content
          Row(
            children: [
              // Image
              Container(
                width: 48,
                height: 48,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F6FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
              const SizedBox(width: 12),

              // Texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Price
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "\$",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3561FE),
                            ),
                          ),
                        ),
                        const SizedBox(width: 2),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Color(0xFF3561FE),
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: "$integerPart,",
                                style: const TextStyle(fontSize: 20),
                              ),
                              TextSpan(
                                text: decimalPart,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // percentage badge
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: percentageColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(arrowIcon, size: 25, color: percentageColor),
                  const SizedBox(width: 2),
                  Text(
                    percentage,
                    style: TextStyle(
                      color: percentageColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
