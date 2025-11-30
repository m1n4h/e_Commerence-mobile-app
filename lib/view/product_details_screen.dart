import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/utils/app_textstyle.dart';
import 'package:ecommerce_app/view/widgets/bags_selector.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Details',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _shareProduct(
              context,
              product.name,
              product.description,
            ),
            icon: Icon(
              Icons.share,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PRODUCT IMAGE WITH FAVORITE BUTTON
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      product.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: product.isFavorite
                          ? Theme.of(context).primaryColor
                          : (isDark ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // PRODUCT NAME & PRICE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product.name,
                    style: AppTextStyle.withColor(
                      AppTextStyle.h2,
                      Theme.of(context).textTheme.headlineMedium!.color!,
                    ),
                  ),
                ),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: AppTextStyle.withColor(
                    AppTextStyle.h2,
                    Theme.of(context).textTheme.headlineMedium!.color!,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // CATEGORY
            Text(
              product.Category,
              style: AppTextStyle.withColor(
                AppTextStyle.bodyMedium,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),

            const SizedBox(height: 20),

            // SIZE SELECTION TITLE
            Text(
              'Select bag size',
              style: AppTextStyle.withColor(
                AppTextStyle.labelMedium,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
            const SizedBox(height: 10),

            // BAG SELECTOR
            BagSelector(
              onSelected: (index) {
                setState(() {
                  selectedSizeIndex = index;
                });
              },
            ),

            const SizedBox(height: 20),

            // PRODUCT DESCRIPTION
            Text(
              product.description,
              style: AppTextStyle.bodyMedium,
            ),

            const SizedBox(height: 100),

            // ACTION BUTTONS
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      'Add to Cart',
                      style: AppTextStyle.bodyMedium,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      'Buy Now',
                      style: AppTextStyle.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _shareProduct(
      BuildContext context, String productName, String description) async {
    final box = context.findRenderObject() as RenderBox?;
    const String shopLink = 'https://yourshop.com/product';
    final shareMessage =
        '$productName\n\n$description\n\nShop now at $shopLink';
    try {
      final result = await Share.share(
        shareMessage,
        subject: productName,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
      if (result.status == ShareResultStatus.success) {
        debugPrint("Shared successfully!");
      }
    } catch (e) {
      debugPrint("Error sharing product: $e");
    }
  }
}
