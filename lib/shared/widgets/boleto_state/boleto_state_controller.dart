import 'package:payflow_nlw6/models/BoletoModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoStateController {
  Future<void> deleteBoleto({required String barcode}) async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("boletos") ?? <String>[];
      List<BoletoModel> boletos =
          response.map((boleto) => BoletoModel.fromJson(boleto)).toList();

      for (BoletoModel bm in boletos) {
        if (bm.barcode == barcode) {
          boletos.remove(bm);
          break;
        }
      }

      instance.setStringList(
          "boletos", boletos.map((model) => model.toJson()).toList());
    } catch (e) {}
  }
}
