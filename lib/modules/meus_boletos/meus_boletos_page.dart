import 'package:flutter/material.dart';
import 'package:payflow_nlw6/core/app_colors.dart';
import 'package:payflow_nlw6/core/app_text_styles.dart';
import 'package:payflow_nlw6/models/BoletoModel.dart';
import 'package:payflow_nlw6/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:payflow_nlw6/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow_nlw6/shared/widgets/boleto_list/boleto_list_widget.dart';
import 'package:animated_card/animated_card.dart';

class MeusBoletosPage extends StatefulWidget {
  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              color: AppColors.primary,
              height: 40,
              width: double.maxFinite,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ValueListenableBuilder<List<BoletoModel>>(
                valueListenable: controller.boletosNotifier,
                builder: (_, List boletos, __) => AnimatedCard(
                  direction: AnimatedCardDirection.top,
                  child: BoletoInfoWidget(size: boletos.length),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  "Meus Boletos",
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
