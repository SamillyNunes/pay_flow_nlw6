import 'package:flutter/material.dart';

import 'package:payflow_nlw6/core/app_colors.dart';
import 'package:payflow_nlw6/core/app_text_styles.dart';
import 'package:payflow_nlw6/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  const BottomSheetWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text.rich(
                        TextSpan(
                          text: title,
                          style: AppTextStyles.buttonBoldHeading,
                          children: [
                            TextSpan(
                              text: "\n$subtitle",
                              style: AppTextStyles.buttonHeading,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.stroke,
                    ),
                    SetLabelButtons(
                      primaryLabel: primaryLabel,
                      primaryOnPressed: primaryOnPressed,
                      secondaryLabel: secondaryLabel,
                      secondaryOnPressed: secondaryOnPressed,
                      enablePrimaryColor: true,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
