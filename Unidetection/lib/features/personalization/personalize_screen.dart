import 'package:flutter/material.dart';
import 'package:unidection/core/data/user_input.dart';
import 'package:unidection/core/model/student_input.dart';
import 'package:unidection/core/services/api_service.dart';
import 'package:unidection/features/result/result_screen.dart';

class PersonalizeScreen extends StatefulWidget {
  const PersonalizeScreen({super.key});

  @override
  State<PersonalizeScreen> createState() => _PersonalizeScreenState();
}

class _PersonalizeScreenState extends State<PersonalizeScreen> {
  String selectedSchoolTrack = '';
  String selectedMajor = '';
  String selectedUniversityType = '';
  String selectedUniversityLocation = '';
  TextEditingController finalGradeController = TextEditingController();
  TextEditingController tuitionFeeRangeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  onTapRecommendation() {
    if (_formKey.currentState!.validate()) {
      final studentInput = StudentInput(
        track: selectedSchoolTrack,
        preferredMajor: selectedMajor,
        universityType: selectedUniversityType,
        finalGrade: double.parse(finalGradeController.text),
        tuitionBudget: double.parse(tuitionFeeRangeController.text),
        universityLocation: selectedUniversityLocation,
      );
      ApiService.getRecommendation(studentInput).then((result) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ResultScreen(result: result),
          ),
        );
      }).catchError(
        (error) {
          // Handle error here, e.g., show a snackbar or dialog
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personalize Your Experience',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                // ComboBox 1
                DropdownButtonFormField<String>(
                  dropdownColor: Color.fromARGB(255, 117, 157, 178),
                  menuMaxHeight: 300,
                  decoration: InputDecoration(
                    labelText: 'High School Track',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  items: highSchoolTrack.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedSchoolTrack = value!;
                  },
                ),
                const SizedBox(height: 30),

                // ComboBox 2
                DropdownButtonFormField<String>(
                  dropdownColor: Color.fromARGB(255, 117, 157, 178),
                  menuMaxHeight: 300,
                  decoration: InputDecoration(
                    labelText: 'Preferred Major',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  items: preferedMajor.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedMajor = value!;
                  },
                ),
                const SizedBox(height: 30),

                DropdownButtonFormField<String>(
                  dropdownColor: Color.fromARGB(255, 117, 157, 178),
                  menuMaxHeight: 300,
                  decoration: InputDecoration(
                    labelText: 'University Location',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  items: universityLocation.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedUniversityLocation = value!;
                  },
                ),
                const SizedBox(height: 30),
                // ComboBox 3
                DropdownButtonFormField<String>(
                  dropdownColor: Color.fromARGB(255, 117, 157, 178),
                  menuMaxHeight: 300,
                  decoration: InputDecoration(
                    labelText: 'University Type',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  items: universityType.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedUniversityType = value!;
                  },
                ),
                const SizedBox(height: 30),

                // TextField 1
                TextFormField(
                  controller: finalGradeController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Final Grade',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your final grade';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),

                // TextField 2
                TextFormField(
                  controller: tuitionFeeRangeController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Tuition Fee Range',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your tuition fee range';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 117, 157, 178),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    onPressed: onTapRecommendation,
                    child: Text(
                      "Get Recommendations",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
