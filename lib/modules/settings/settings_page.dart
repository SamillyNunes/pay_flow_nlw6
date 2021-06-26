import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow_nlw6/core/app_colors.dart';
import 'package:payflow_nlw6/core/app_text_styles.dart';
import 'package:payflow_nlw6/modules/login/login_controller.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Row(
            children: [
              BackButton(
                color: AppColors.background,
              ),
              Text(
                "Configurações",
                style: AppTextStyles.titleBoldBackground,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                await Provider.of<LoginController>(context, listen: false)
                    .googleSignOut(context);
              },
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.signOutAlt,
                    color: AppColors.body,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "Sair",
                    style: AppTextStyles.buttonBoldHeading,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
