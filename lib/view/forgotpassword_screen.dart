import 'package:ecommerce_app/utils/app_textstyle.dart';
import 'package:ecommerce_app/view/signin_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_textfield.dart';
// import 'package:ecommerce_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Reset Password'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Enter your email to reset password',
                style: AppTextStyle.withColor(
                    AppTextStyle.bodyLarge,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!),
              ),

            


                        //email textfield
              const SizedBox(height: 20),
              CustomTextfield(
                label: 'Email',
                prefixIcon: Icons.email,
                controller: emailController,
                validator: (Value){
                  if (Value == null || Value.isEmpty){
                    return 'please enter your email';
                  }
                  if (!GetUtils.isEmail(Value)){
                    return'please enter a valid email';
                  }
                  return null;
                },
              ),



              const SizedBox(height: 40),
              // send reset link button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    showSuccessDialog(context);

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12))
                  ), 
                  child: Text(
                    'send reset link',
                    style: AppTextStyle.withColor(AppTextStyle.buttonMedium,
                     Colors.white),
                  )),
              )
              // ElevatedButton(
              //   onPressed: () {
              //     // Reset password logic
              //      Get.off(() => const SigninScreen());
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Theme.of(context).primaryColor,
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              //   ),
              //   child: const Text(
              //     'Send Reset Link',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
  // shows success dialog
  void showSuccessDialog(BuildContext context){
Get.dialog(
  AlertDialog(
    title: Text(
      'check your Email',
      style: AppTextStyle.h1,
    ),
    content: Text(
      'we have sent password recovery to your email',
      style: AppTextStyle.bodyMedium,
    ),
    actions: [
      TextButton(onPressed: ()=> Get.back(),
       child: Text('ok',
       style: AppTextStyle.withColor(AppTextStyle.buttonMedium,
       Theme.of(context).primaryColor,
        ),))
    ],
  )
);
  }
}
