import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidection/core/providers/auth_provider.dart';
import 'package:unidection/core/providers/fetch_user.dart';
import 'package:unidection/features/home/homa_screen.dart';
import 'package:unidection/features/signUp/signup_screen.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  onTapSingIn() async {
    print('in Sign in function');
    try {
      await ref.read(authProvider.notifier).signIn(
            emailController.text.trim(),
            passwordController.text.trim(),
          );
      await ref.read(fetchUserProvider.notifier).fetchUserData();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } catch (e) {
      if (mounted) {
        print(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
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
              SizedBox(height: 20),
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
                      onTapSingIn();
                    }
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ));
                },
                child: Text(
                  "Don't have an account? Sign Up",
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
