import 'package:ecommerce_app/view/otpverification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GuestSigninScreen extends StatelessWidget {
  const GuestSigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in as Guest'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(height: 80),
            const TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Enter your phone number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.off(() => const OtpVerificationScreen());
              },
              style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: const Text(
                'Request OTP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                ),
            
            ),
           
          ],
        ),
      ),
    );
  }
}
