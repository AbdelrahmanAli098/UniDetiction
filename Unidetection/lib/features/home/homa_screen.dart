import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidection/core/model/user.dart';
import 'package:unidection/core/providers/auth_provider.dart';
import 'package:unidection/core/providers/fetch_user.dart';
import 'package:unidection/features/personalization/personalize_screen.dart';
import 'package:unidection/features/signIn/sigin_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final AsyncValue<UserModel> currentUser; // Declare currentUser
  @override
  void initState(){
    currentUser = ref
        .read(fetchUserProvider); // Fetch user data when the screen is initialized
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.red,
              size: 40,
            ),
            onPressed: () async {
              try {
                await ref
                    .read(authProvider.notifier)
                    .signOut(); // Sign out the user
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                ); // Navigate to the sign-in screen
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: $e')),
                );
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Hello, ${currentUser.value?.username}',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            const SizedBox(height: 50),
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 117, 157, 178),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PersonalizeScreen(),
                    ),
                  );
                },
                child: Text(
                  "Get my Recommendations",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
