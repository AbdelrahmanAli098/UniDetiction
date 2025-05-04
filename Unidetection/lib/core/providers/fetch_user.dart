import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidection/core/model/user.dart';

class FetchUserProvider extends StateNotifier<AsyncValue<UserModel>> {
  FetchUserProvider() : super(const AsyncValue.loading());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchUserData() async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        state = AsyncValue.error('User not logged in', StackTrace.current);
        return;
      }
      final userDoc = await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        final userModel = UserModel.fromFirebase(userDoc.data()!);
        state = AsyncValue.data(userModel);
      } else {
        state = AsyncValue.error('User not found', StackTrace.current);
      }
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

}

final fetchUserProvider = StateNotifierProvider<FetchUserProvider, AsyncValue<UserModel>>(
  (ref) => FetchUserProvider(),
);