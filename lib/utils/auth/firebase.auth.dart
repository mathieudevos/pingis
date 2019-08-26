import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pingis/components/snackbarProvider.dart';
import 'firestore.auth.dart';

class FirebaseAuthService {
  final _context;

  FirebaseAuthService(BuildContext context) : _context = context;

  // FirebaseAuthService internals
  final _auth = FirebaseAuth.instance;

  Future<void> signIn(String email, String password) async {
    try {
      final authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('[INFO] Signed in with FIREBASE: ' + authResult.user.displayName);
      FirestoreAuthService().updateUserData(authResult.user);
    } catch (e) {
      showError(_context, e);
    }
  }

  Future<void> signUp(String username, String email, String password) async {
    try {
      final authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('[INFO] Signed up with FIREBASE: ' + authResult.user.displayName);
      FirestoreAuthService().updateUserData(authResult.user, username: username);
    } catch (e) {
      showError(_context, e.toString());
    }
  }

  void signOut() {
    _auth.signOut();
  }
}