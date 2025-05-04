import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unidection/core/model/recommendation_result.dart';
import 'package:unidection/core/model/student_input.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8000"; // Adjust as needed
  //static const String baseUrl = "http://192.168.1.3:8000"; // Adjust as needed

  static Future<RecommendationResult> getRecommendation(
      StudentInput input) async {
    final response = await http.post(
      Uri.parse('$baseUrl/recommend'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(input.toJson()),
    );

    if (response.statusCode == 200) {
      print('Success: -----------------------------');
      print(json.decode(response.body).toString());
      return RecommendationResult.fromJson(json.decode(response.body));
    } else {
      final errorData = json.decode(response.body);
      print(errorData.toString());
      throw Exception(
          errorData['detail'] ?? 'Failed to get recommendation');
    }
  }
}