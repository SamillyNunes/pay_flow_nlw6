import 'package:flutter/material.dart';

import 'package:payflow_nlw6/core/app_colors.dart';
import 'package:payflow_nlw6/core/app_images.dart';
import 'package:payflow_nlw6/core/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;

  const SocialLoginButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * 0.05,
        decoration: BoxDecoration(
          color: AppColors.shape,
          borderRadius: BorderRadius.circular(5),
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.stroke),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.google,
                  ),
                  const SizedBox(width: 16),
                  Container(
                    height: size.height * 0.05,
                    width: 1,
                    color: AppColors.stroke,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                "Entrar com Google",
                textAlign: TextAlign.center,
                style: AppTextStyles.buttonGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
