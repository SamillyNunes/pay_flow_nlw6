import 'package:flutter/material.dart';
import 'package:payflow_nlw6/core/app_colors.dart';
import 'package:payflow_nlw6/core/app_images.dart';
import 'package:payflow_nlw6/core/app_text_styles.dart';

class BoletoInfoWidget extends StatelessWidget {
  final int size;
  const BoletoInfoWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadiusDirectional.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppImages.logomini,
            color: AppColors.background,
            width: 56,
            height: 34,
          ),
          Container(
            width: 1,
            height: 32,
            color: AppColors.background,
          ),
          Text.rich(
            TextSpan(
              text: "Você tem ",
              style: AppTextStyles.captionBackground,
              children: [
                TextSpan(
                  text: "$size boletos\n",
                  style: AppTextStyles.captionBoldBackground,
                ),
                TextSpan(
                  text: "cadastrados para pagar",
                  style: AppTextStyles.captionBackground,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
