import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product; // RECEIVING THE PRODUCT

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screeWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      constraints: BoxConstraints(maxWidth: screeWidth * 0.9),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black : Colors.grey.shade400,
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    product.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // FAVORITE BUTTON
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: product.isFavorite
                        ? Theme.of(context).primaryColor
                        : (isDark ? Colors.grey[400] : Colors.grey),
                  ),
                ),
              ),

              // DISCOUNT BADGE
              if (product.oldprice != null)
                Positioned(
                  left: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
"-${calculateDiscount(product.price, product.oldprice!)}% off",
                      style: AppTextStyle.withColor(
                        AppTextStyle.withWeight(
                            AppTextStyle.bodySmall, FontWeight.bold),
                        Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // PRODUCT DETAILS
          Padding(
            padding: EdgeInsets.all(screeWidth * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // PRODUCT NAME
                Text(
                  product.name,
                  maxLines: 1,
                  style: AppTextStyle.withColor(
                    AppTextStyle.withWeight(
                        AppTextStyle.h3,
                         FontWeight.bold),
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                ),

                const SizedBox(height: 4),
                      // product category

                      Text(
                        product.Category,
                         style: AppTextStyle.withColor(
                    AppTextStyle.bodyMedium,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),

                      ),
                   SizedBox(height: screeWidth * 0.01,),
                   Row(
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: AppTextStyle.withColor(
                    AppTextStyle.withWeight(
                        AppTextStyle.bodyLarge, 
                        FontWeight.bold),
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                      )
                    ],
                   )

                
              ],
            ),
          )
        ],
      ),
    );
  }
  
  // calculate discount
  int calculateDiscount(double currentPrice, double oldPrice) {
  return (((oldPrice - currentPrice) / oldPrice) * 100).round();
}
}
