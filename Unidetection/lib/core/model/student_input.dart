class StudentInput {
  final String preferredMajor;
  final String universityType;
  final String track;
  final double tuitionBudget;
  final double finalGrade;
  final String universityLocation;

  StudentInput({
    required this.preferredMajor,
    required this.universityType,
    required this.track,
    required this.tuitionBudget,
    required this.finalGrade,
    required this.universityLocation,
  });

  Map<String, dynamic> toJson() => {
        'preferred_major': preferredMajor,
        'university_type': universityType,
        'track': track,
        'preferred_location': universityLocation,
        'tuition_budget': tuitionBudget,
        'student_grade': finalGrade,
      };
}