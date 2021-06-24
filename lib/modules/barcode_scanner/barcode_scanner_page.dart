import 'package:flutter/material.dart';
import 'package:payflow_nlw6/core/app_colors.dart';
import 'package:payflow_nlw6/core/app_text_styles.dart';
import 'package:payflow_nlw6/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:payflow_nlw6/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:payflow_nlw6/shared/widgets/label_button/label_button.dart';
import 'package:payflow_nlw6/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarCodeScannerPage extends StatefulWidget {
  @override
  _BarCodeScannerPageState createState() => _BarCodeScannerPageState();
}

class _BarCodeScannerPageState extends State<BarCodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      title: "Não foi possível identificar um código de barras.",
      subtitle: "Tente escanear novamente ou digite o código do seu boleto.",
      primaryLabel: "Escanear novamente",
      primaryOnPressed: () {},
      secondaryLabel: "Digitar código",
      secondaryOnPressed: () {},
    );
    // return SafeArea(
    //   top: true,
    //   left: true,
    //   bottom: true,
    //   right: true,
    //   child: RotatedBox(
    //     quarterTurns: 1,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         backgroundColor: Colors.black,
    //         centerTitle: true,
    //         title: Text(
    //           "Escaneie o código de barras do boleto",
    //           style: AppTextStyles.buttonBackground,
    //         ),
    //         leading: BackButton(
    //           color: AppColors.background,
    //         ),
    //       ),
    //       body: Column(
    //         children: [
    //           Expanded(
    //             child: Container(
    //               color: Colors.black,
    //             ),
    //           ),
    //           Expanded(
    //             flex: 2,
    //             child: Container(
    //               color: Colors.transparent,
    //             ),
    //           ),
    //           Expanded(
    //             child: Container(
    //               color: Colors.black,
    //             ),
    //           ),
    //         ],
    //       ),
    //       bottomNavigationBar: SetLabelButtons(
    //         primaryLabel: "Inserir código do boleto",
    //         primaryOnPressed: () {},
    //         secondaryLabel: "Adicionar da galeria",
    //         secondaryOnPressed: () {},
    //       ),
    //     ),
    //   ),
    // );
  }
}
