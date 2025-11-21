import 'package:ecommerce_app/utils/app_textstyle.dart';
import 'package:ecommerce_app/view/signin_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_textfield.dart';
// import 'package:ecommerce_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                'Create Account',
                style: AppTextStyle.withColor(
                    AppTextStyle.h1,
                    Theme.of(context).textTheme.bodyLarge!.color!),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign up to get started',
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
              const SizedBox(height: 40),

              CustomTextfield(
                label: 'Full Name',
                prefixIcon: Icons.person,
                controller: nameController,
              ),
              const SizedBox(height: 20),
              CustomTextfield(
                label: 'Email',
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
              const SizedBox(height: 20),
              CustomTextfield(
                label: 'Password',
                prefixIcon: Icons.lock,
                isPassword: true,
                controller: passwordController,
              ),
                const SizedBox(height: 20),
              CustomTextfield(
                label: 'confirm password',
                prefixIcon: Icons.lock,
                isPassword: true,
                controller: passwordController,
              ),
              const SizedBox(height: 40),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.off(() => const SigninScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
