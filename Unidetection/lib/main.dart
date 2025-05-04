import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidection/features/onBoarding/onboarding_screen.dart';
import 'package:unidection/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Required for async initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Auto-generated config
  );
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application. 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 8, 37, 52),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 8, 37, 52),
          foregroundColor: Colors.white,
        ),
      ),
      home: const OnboardingScreen(),
    );
  }
}
