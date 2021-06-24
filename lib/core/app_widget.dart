import 'package:flutter/material.dart';
import 'package:payflow_nlw6/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow_nlw6/modules/home/home_page.dart';
import 'package:payflow_nlw6/modules/login/login_page.dart';
import 'package:payflow_nlw6/modules/splash/splash_page.dart';

import 'app_colors.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/barcode_scanner": (context) => BarCodeScannerPage(),
      },
    );
  }
}
