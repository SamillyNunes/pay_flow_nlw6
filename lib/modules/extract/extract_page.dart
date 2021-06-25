import 'package:flutter/material.dart';
import 'package:payflow_nlw6/core/app_colors.dart';
import 'package:payflow_nlw6/core/app_text_styles.dart';
import 'package:payflow_nlw6/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow_nlw6/shared/widgets/boleto_list/boleto_list_widget.dart';

class ExtractPage extends StatefulWidget {
  @override
  _ExtractPageState createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  "Meus Extratos",
                  style: AppTextStyles.titleBoldHeading,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Divider(
                  color: AppColors.stroke,
                  thickness: 1,
                  height: 1,
                ),
              ),
              BoletoListWidget(
                controller: controller,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
