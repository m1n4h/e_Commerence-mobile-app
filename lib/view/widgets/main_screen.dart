import 'package:ecommerce_app/controllers/navigation_controller.dart';
import 'package:ecommerce_app/controllers/theme_controllers.dart';
import 'package:ecommerce_app/view/Home_screen.dart';
import 'package:ecommerce_app/view/account_screen.dart';
import 'package:ecommerce_app/view/shopping_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_button_navbar.dart';
import 'package:ecommerce_app/view/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.put(NavigationController());

    return GetBuilder<ThemeController>(
      builder: (themeController) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Obx(
            () => IndexedStack(
              key: ValueKey(navigationController.currentIndex.value),
              index: navigationController.currentIndex.value,
              children: [
                HomeScreen(),
                ShoppingScreen(),
                WishlistScreen(),
                AccountScreen(),
              ],
            ),
          ),
        ),

        bottomNavigationBar: const CustomButtonNavbar(),
      ),
    );
  }
}
