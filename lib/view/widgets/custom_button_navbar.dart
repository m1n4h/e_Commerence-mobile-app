import 'package:ecommerce_app/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonNavbar extends StatelessWidget {
  const CustomButtonNavbar({super.key});
  

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.find<NavigationController>();
  return Obx(
    () => BottomNavigationBar(
      currentIndex: navigationController.currentIndex.value,
      onTap: (index) => navigationController.changeIndex(index),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
           label: 'Home'

          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
           label: 'Shopping'

          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
           label: 'wishlist'

          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
           label: 'Account'

          ),
          
      ],
      )

  );
  }
}