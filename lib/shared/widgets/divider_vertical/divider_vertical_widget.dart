import 'package:flutter/material.dart';
import 'package:payflow_nlw6/core/app_colors.dart';

class DividerVerticalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: double.maxFinite,
      color: AppColors.stroke,
    );
  }
}
