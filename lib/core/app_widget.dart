import 'package:flutter/material.dart';
import 'package:payflow_nlw6/models/user_model.dart';
import 'package:payflow_nlw6/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow_nlw6/modules/home/home_page.dart';
import 'package:payflow_nlw6/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payflow_nlw6/modules/login/login_controller.dart';
import 'package:payflow_nlw6/modules/login/login_page.dart';
import 'package:payflow_nlw6/modules/settings/settings_page.dart';
import 'package:payflow_nlw6/modules/splash/splash_page.dart';
import 'package:provider/provider.dart';

import 'app_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => LoginController(),
      child: MaterialApp(
        title: 'PayFlow',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          primarySwatch: Colors.orange,
        ),
        // home: LoginPage(),
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => SplashPage(),
          "/home": (context) => HomePage(
                user: ModalRoute.of(context)!.settings.arguments as UserModel,
              ),
          "/login": (context) => LoginPage(),
          "/settings": (context) => SettingsPage(),
          "/barcode_scanner": (context) => BarCodeScannerPage(),
          "/insert_boleto": (context) => InsertBoletoPage(
                barcode: ModalRoute.of(context) != null
                    ? ModalRoute.of(context)!.settings.arguments.toString()
                    : null,
              ),
        },
      ),
    );
  }
}
