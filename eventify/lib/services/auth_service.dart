import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final ValueNotifier<AuthService> authservice = ValueNotifier(AuthService());

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Login
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Signup
  Future<UserCredential> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    // Update display name
    await userCredential.user?.updateDisplayName(name);
    await userCredential.user?.reload();
    return userCredential;
  }

  // Reset Password with Email
  Future<void> resetPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  //Delete Account
  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    //Delete from Firebase Auth
    await currentUser!.delete();
    await _firebaseAuth.signOut();
  }

  // Signout
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
