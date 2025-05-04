import 'package:unidection/core/model/major.dart';

class University {
  final String name;
  final String location;
  final String type;
  final String website;
  final Major major;

  University({
    required this.name,
    required this.location,
    required this.type,
    required this.website,
    required this.major,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['name'],
      location: json['location'],
      type: json['type'],
      website: json['website'],
      major: Major.fromJson(json['major']),
    );
  }
}
