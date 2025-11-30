import 'package:ecommerce_app/view/widgets/category_chips.dart';
import 'package:ecommerce_app/view/widgets/custom_search_bar.dart';
import 'package:ecommerce_app/view/widgets/product_grid.dart';
import 'package:ecommerce_app/view/widgets/sale_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/controllers/theme_controllers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('Assets/images/image6.jpeg'),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Alex',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),

                  // Notification / Cart buttons
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),

                  // Theme toggle button
                  GetBuilder<ThemeController>(
                    builder: (themeController) => IconButton(
                      onPressed: () => themeController.toggleTheme(),
                      icon: Icon(
                        themeController.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            const CustomSearchBar(),

            // Category Chips
            const CategoryChips(),

            // Sale Banner
            const SaleBanner(),

            // Popular Product Header (FIXED)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Products',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // padding grid
            const Expanded(child: ProductGrid()),
          ],
        ),
      ),
    );
  }
}
