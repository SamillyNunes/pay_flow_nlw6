import 'package:flutter/material.dart';

import 'package:payflow_nlw6/models/BoletoModel.dart';
import 'package:payflow_nlw6/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow_nlw6/shared/widgets/boleto_tile/boleto_tile_widget.dart';

class BoletoListWidget extends StatefulWidget {
  final BoletoListController controller;
  const BoletoListWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
      valueListenable: widget.controller.boletosNotifier,
      builder: (_, boletos, __) => Column(
        children: boletos
            .map((boleto) => BoletoTileWidget(boletoModel: boleto))
            .toList(),
      ),
    );
  }
}
