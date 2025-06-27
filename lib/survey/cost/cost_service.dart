// cost_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cost_model.dart';

class CostService {
  Future<CostResponse> calculateCost(String token,CostRequest request) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/survey/calculate-cost');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      print(response.body);
      final data = jsonDecode(response.body);
      return CostResponse.fromJson(data);
    } else {
      throw Exception("فشل في حساب التكلفة");
    }
  }
}
