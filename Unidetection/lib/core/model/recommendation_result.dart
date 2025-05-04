import 'package:unidection/core/model/university.dart';

class RecommendationResult {
  final bool isSuccess;
  final University? university;
  final String? reason;

  RecommendationResult({
    required this.isSuccess,
    this.university,
    this.reason,
  });

  factory RecommendationResult.fromJson(Map<String, dynamic> json) {
    return RecommendationResult(
      isSuccess: json['recommended'],
      university: json['university'] != null
          ? University.fromJson(json['university'])
          : null,
      reason: json['reason']?.toString(),
    );
  }
}