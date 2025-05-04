import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthProvider extends StateNotifier<String> {
  AuthProvider() : super('') {
    // Initialize the provider with an empty string or any default value
  }
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Sign In with email and password
  Future<void> signIn(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = userCredential.user!.uid;
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  // Sign Up with email and password
  Future<void> signUp(String email, String password, String username) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final newUser = userCredential.user;
      if (newUser != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(newUser.uid)
            .set({
          'email': email,
          'username': username,
          'uid': newUser.uid,
          'isAdmin': false,
        });
        state = newUser.uid; // Update the state with the new user's UID
      }
    } catch (e) {
      throw Exception('Failed to sign up: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      state = ''; // Clear the state on sign out
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }
}

final authProvider = StateNotifierProvider<AuthProvider, String>((ref) {
  return AuthProvider();
});
