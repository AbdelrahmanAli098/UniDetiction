import 'package:flutter/material.dart';
import 'package:unidection/features/signUp/signup_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 60),
              const Text(
                'Start Your University Journey',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 90,
                    vertical: 25,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: const Color.fromARGB(255, 117, 157, 178),
                ),
                onPressed: () {
                  // Navigate to the next screen or perform an action
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: const Text('Start', style: TextStyle(color: Colors.white, fontSize: 25),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}