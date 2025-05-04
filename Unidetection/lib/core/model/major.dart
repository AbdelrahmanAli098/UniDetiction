class Major {
  final String name;
  final double tuitionFees;
  final double requiredGrade;

  Major({
    required this.name,
    required this.tuitionFees,
    required this.requiredGrade,
  });

  factory Major.fromJson(Map<String, dynamic> json) {
    return Major(
      name: json['name'],
      tuitionFees: json['tuition_fees'].toDouble(),
      requiredGrade: json['required_grade'].toDouble(),
    );
  }
}