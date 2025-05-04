import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidection/core/providers/auth_provider.dart';
import 'package:unidection/features/home/homa_screen.dart';
import 'package:unidection/features/signIn/sigin_screen.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _formKey = GlobalKey<FormState>();
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    void onTapSignUp() async {
      String username = usernameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text;
      String confirmPassword = confirmPasswordController.text;

      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match')),
        );
        return;
      }
      try {
        await ref.read(authProvider.notifier).signUp(email, password, username);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign Up Failed: $e')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 183, 181, 181),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 117, 157, 178),
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  counterStyle: TextStyle(
                    color: Colors.white,
                  ),
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 183, 181, 181),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 117, 157, 178),
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  counterStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 183, 181, 181),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 117, 157, 178),
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  counterStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: confirmPasswordController,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 183, 181, 181),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 117, 157, 178),
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  counterStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  // Add logic to compare with the password field
                  return null;
                },
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 117, 157, 178),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      onTapSignUp();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeScreen(), // Replace with your sign in screen widget
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Sign Up Successful')),
                      );
                    }
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle navigation to sign in screen
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          SignInScreen(), // Replace with your sign in screen widget
                    ),
                  );
                },
                child: Text(
                  "Already have an account? Sign In",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
