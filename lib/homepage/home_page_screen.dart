import 'package:flutter/material.dart';

import '../basics/app_colors.dart';
import '../widgets/company_list_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/search_bar_widget.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background_color,
        body: Column(
          children: [
            HeaderWidget(height: height, width: width),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(width * 0.04),
                child: Column(
                  children: [
                    SearchBarWidget(width: width, height: height),
                    SizedBox(height: height * 0.03),
                    const CompanyListWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
