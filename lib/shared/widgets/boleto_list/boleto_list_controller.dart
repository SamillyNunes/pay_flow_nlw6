import 'package:flutter/material.dart';
import 'package:payflow_nlw6/models/BoletoModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController {
  final boletosNotifier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);
  List<BoletoModel> get boletos => boletosNotifier.value;
  set boletos(List<BoletoModel> value) => boletosNotifier.value = value;

  BoletoListController() {
    getBoletos();
  }

  Future<void> getBoletos() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("boletos") ?? <String>[];
      print("instance has boletos? ${instance.containsKey('boletos')}");
      boletos = response.map((boleto) => BoletoModel.fromJson(boleto)).toList();
    } catch (e) {
      boletos = <BoletoModel>[];
    }
  }
}
