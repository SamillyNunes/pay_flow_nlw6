import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow_nlw6/core/app_text_styles.dart';

import 'package:payflow_nlw6/models/BoletoModel.dart';
import 'package:payflow_nlw6/shared/widgets/boleto_state/boleto_state_widget.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel boletoModel;
  const BoletoTileWidget({
    Key? key,
    required this.boletoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return BoletoStateWidget(
              boletoModel: boletoModel,
            );
          },
        );
      },
      child: AnimatedCard(
        direction: AnimatedCardDirection.right,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            boletoModel.name!,
            style: AppTextStyles.titleListTile,
          ),
          subtitle: Text(
            "Vence em: ${boletoModel.dueDate!}",
            style: AppTextStyles.captionBody,
          ),
          trailing: Text.rich(
            TextSpan(
              text: "R\$ ",
              style: AppTextStyles.trailingRegular,
              children: [
                TextSpan(
                  text: "${boletoModel.value!.toStringAsFixed(2)}",
                  style: AppTextStyles.trailingBold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
