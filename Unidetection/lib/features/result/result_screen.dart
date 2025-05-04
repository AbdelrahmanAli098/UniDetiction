import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:unidection/core/model/recommendation_result.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.result});
  final RecommendationResult result; // Assuming you pass the result here
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late Widget isNotSuccessContent;

  @override
  void initState() {
    super.initState();
    isNotSuccessContent = Center(
      child: Text(
        '${widget.result.reason}!, Please try different inputs',
        style: const TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendation Result'),
      ),
      body: widget.result.isSuccess
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'University Name: ${widget.result.university?.name}',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'University Type: ${widget.result.university?.type}',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'University Location: ${widget.result.university?.location}',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'University Website: ',
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: widget.result.university?.website,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                final Uri url = Uri.parse(
                                    widget.result.university?.website ?? '');
                                if (!await launchUrl(url)) {
                                  throw Exception('Could not launch $url');
                                }
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Major: ${widget.result.university?.major.name}',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Grade: ${widget.result.university?.major.requiredGrade}',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Fees: ${widget.result.university?.major.tuitionFees}',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : isNotSuccessContent,
    );
  }
}
