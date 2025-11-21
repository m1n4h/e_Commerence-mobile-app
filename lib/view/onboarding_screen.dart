import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/utils/app_textstyle.dart';
import 'package:ecommerce_app/view/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // If you plan to navigate with GetX later

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentpage = 0;

  final List<onboardingItem> _items = [
    onboardingItem(
      description:
          'Explore the newest fashion trends and find your unique style',
      title: 'Discover Latest Trends',
      image: 'assets/images/intro4.jpg',
    ),
    onboardingItem(
      description:
          'Shop premium quality products from top new brands worldwide',
      title: 'Quality Products',
      image: 'assets/images/image1.jpeg',
    ),
    onboardingItem(
      description:
          'Simple and secure shopping experience at your fingertips',
      title: 'Easy Shopping',
      image: 'assets/images/intro4.jpg',
    ),
  ];

  //handle get started button preressed
void _handleGetstarted(){
  final AuthController authController = Get.find<AuthController>();
  authController.setfirstTime();
  Get.off(() => const SigninScreen());
}
  
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        children: [
          // Onboarding pages
          PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index) {
              setState(() {
                _currentpage = index;
              });
            },
            itemBuilder: (context, index) {
              final item = _items[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    item.image,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.withColor(
                      AppTextStyle.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      item.description,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyLarge,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // Page indicator
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _items.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentpage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentpage == index
                        ? Theme.of(context).primaryColor
                        : (isDark ? Colors.grey[300] : Colors.grey[400]),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),


          // Skip + Next buttons
          Positioned(
            bottom: 50,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Skip button
                TextButton(
                  onPressed: () => _handleGetstarted(),
                  child: Text(
                    'Skip',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                ),

                // Next button
                ElevatedButton(
                  onPressed: () {
                    if (_currentpage < _items.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      _handleGetstarted();
                      // Last page reached — navigate to home or login
                       Get.off(() => const SigninScreen ());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  child:  Text(
                    _currentpage < _items.length -1 ?
                     'Next'
                      : "Get Started",
                      style: TextStyle(color: Colors.white),
                    // style: AppTextStyle.withColor(AppTextStyle.buttonMedium 
                    // .withCopy(TextStyle style, Color color )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Data model
class onboardingItem {
  final String image;
  final String title;
  final String description;

  onboardingItem({
    required this.description,
    required this.title,
    required this.image,
  });
}
