import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow_nlw6/core/app_colors.dart';
import 'package:payflow_nlw6/core/app_text_styles.dart';
import 'package:payflow_nlw6/shared/widgets/input_text/input_text_widget.dart';
import 'package:payflow_nlw6/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 93, vertical: 24),
              child: Text(
                "Preencha os dados do boleto",
                textAlign: TextAlign.center,
                style: AppTextStyles.titleBoldHeading,
              ),
            ),
            SizedBox(height: 24),
            InputTextWidget(
              label: "Nome do boleto",
              icon: Icons.description_outlined,
              onChanged: (value) {},
            ),
            InputTextWidget(
              label: "Vencimento",
              icon: FontAwesomeIcons.timesCircle,
              onChanged: (value) {},
            ),
            InputTextWidget(
              label: "Valor",
              icon: FontAwesomeIcons.wallet,
              onChanged: (value) {},
            ),
            InputTextWidget(
              label: "Código",
              icon: FontAwesomeIcons.barcode,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: "Cancelar",
        primaryOnPressed: () {
          Navigator.pop(context);
        },
        secondaryLabel: "Cadastrar",
        secondaryOnPressed: () {},
        enableSecondaryColor: true,
      ),
    );
  }
}
