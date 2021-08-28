import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInViewModel with ChangeNotifier {
  SignInViewModel({required this.auth});

  final FirebaseAuth auth;

  bool isLoading = false;
  dynamic error;

  Future<void> signInAnonymously() async {
    await _commonSignIn(auth.signInAnonymously);
  }

  Future<void> _commonSignIn(Future<UserCredential> Function() signIn) async {
    try {
      isLoading = true;
      notifyListeners();
      final user = await signIn();
      print('user: $user');
      error = null;
    } catch (e) {
      error = e;
      print(e);
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
