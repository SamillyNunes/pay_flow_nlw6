import 'package:flutter/material.dart';
import 'package:payflow_nlw6/core/app_colors.dart';
import 'package:payflow_nlw6/core/app_images.dart';
import 'package:payflow_nlw6/shared/auth/auth_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              AppImages.union,
            ),
          ),
          Center(
            child: Image.asset(
              AppImages.logoFull,
            ),
          ),
        ],
      ),
    );
  }
}
