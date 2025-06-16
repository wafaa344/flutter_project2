import 'package:get/get.dart';

import 'CompanyService.dart';
import 'company_model.dart';


class CompanyController extends GetxController {
  var companies = <Company>[].obs;
  var isLoading = false.obs;

  final CompanyService _service = CompanyService();

  @override
  void onInit() {
    super.onInit();
    fetchCompanies();
  }

  void fetchCompanies() async {
    isLoading.value = true;

    final response = await _service.fetchCompanies();

    if (response != null && response.success) {
      companies.assignAll(response.data);
    } else {
      print("فشل في تحميل الشركات");
    }

    isLoading.value = false;
  }
}
