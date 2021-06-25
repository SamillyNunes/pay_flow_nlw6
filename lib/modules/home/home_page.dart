import 'package:flutter/material.dart';
import 'package:payflow_nlw6/core/app_colors.dart';
import 'package:payflow_nlw6/core/app_text_styles.dart';
import 'package:payflow_nlw6/models/BoletoModel.dart';
import 'package:payflow_nlw6/modules/home/home_controller.dart';
import 'package:payflow_nlw6/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow_nlw6/shared/widgets/boleto_list/boleto_list_widget.dart';
import 'package:payflow_nlw6/shared/widgets/boleto_tile/boleto_tile_widget.dart';

class HomePage extends StatelessWidget {
  final controller = HomeController();

  final pages = [
    MeusBoletosPage(),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  text: "Olá, ",
                  style: AppTextStyles.titleRegular,
                  children: [
                    TextSpan(
                      text: "Samilly",
                      style: AppTextStyles.titleBoldBackground,
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                "Mantenha as suas contas em dia",
                style: AppTextStyles.captionShape,
              ),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.currentPageNotifier,
        builder: (context, int indexPage, child) => pages[indexPage],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: controller.currentPageNotifier,
        builder: (context, int indexPage, child) => Container(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  controller.setPage = 0;
                },
                icon: Icon(
                  Icons.home,
                  color: indexPage == 0 ? AppColors.primary : AppColors.body,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/insert_boleto");
                },
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.setPage = 1;
                },
                icon: Icon(
                  Icons.description_outlined,
                  color: indexPage == 1 ? AppColors.primary : AppColors.body,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
