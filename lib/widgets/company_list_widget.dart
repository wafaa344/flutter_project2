import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homepage/home_page_controller.dart';
import 'company_card.dart';

class CompanyListWidget extends StatelessWidget {
  const CompanyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CompanyController controller = Get.find();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.companies.isEmpty) {
        return const Center(child: Text('لا توجد شركات متاحة حالياً'));
      }

      return Expanded(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'الشركات:',
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: controller.companies.length,
                itemBuilder: (context, index) {
                  final company = controller.companies[index];
                  return CompanyCard(companyModel: company);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
