import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow_nlw6/core/app_colors.dart';
import 'package:payflow_nlw6/core/app_text_styles.dart';
import 'package:payflow_nlw6/models/BoletoModel.dart';
import 'package:payflow_nlw6/shared/widgets/boleto_state/boleto_state_controller.dart';

class BoletoStateWidget extends StatelessWidget {
  final BoletoModel boletoModel;
  final BoletoStateController boletoStateController = BoletoStateController();

  BoletoStateWidget({
    Key? key,
    required this.boletoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 293,
      width: double.maxFinite,
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 43,
            height: 2,
            color: AppColors.stroke,
          ),
          Container(
            width: 219,
            child: Text.rich(
              TextSpan(
                text: "O boleto ",
                style: AppTextStyles.titleHeading,
                children: [
                  TextSpan(
                    text: this.boletoModel.name,
                    style: AppTextStyles.titleBoldHeading,
                  ),
                  TextSpan(
                    text: " no valor de R\$ ",
                  ),
                  TextSpan(
                    text: this.boletoModel.value!.toStringAsFixed(2),
                    style: AppTextStyles.titleBoldHeading,
                  ),
                  TextSpan(
                    text: " foi pago?",
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ainda não",
                    style: AppTextStyles.buttonHeading,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sim",
                      style: AppTextStyles.buttonBackground,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  this
                      .boletoStateController
                      .deleteBoleto(barcode: boletoModel.barcode!);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.trash,
                      color: AppColors.delete,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "Deletar boleto",
                      style: AppTextStyles.delete,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
