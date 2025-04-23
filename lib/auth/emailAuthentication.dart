import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_design/utilites/customSnackbar.dart';

Future<bool> register(
  BuildContext context,
  String email,
  String password,
) async {
  try {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    await userCredential.user?.sendEmailVerification();
    showSnackbar(context, 'Verification email sent. Please check your inbox.');
    return true;
  } on FirebaseAuthException catch (e) {
    showSnackbar(context, e.message ?? 'Registration failed');
    return false;
  }
}



Future<bool> login(String email, String password, BuildContext context) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return true;
  } on FirebaseAuthException catch (e) {
    SizedBox(height: 20, child: showSnackbar(context,e.message ?? 'Login failed' ));
    return false;
    // return false;
  }
}



Future<UserCredential?> googleSignIn(BuildContext context) async {
  try {
    final GoogleSignInAccount? user = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await user!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } on FirebaseAuthException catch (e) {
    showSnackbar(context, e.toString());
  }
}



Future<void> sendVerificationEmail(context) async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    await user?.sendEmailVerification();
    showSnackbar(context, 'Verification email sent!');
  } catch (e) {
    print('Error sending verification email: $e');
    showSnackbar(context, 'Failed to send verification email.');
  }
}

Future<void> resetPassword(String email,context) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
   showSnackbar(context, "Password reset email sent!");
  } catch (e) {
    print(e);
    showSnackbar(context, "Error: ${e.toString()}");
  }
}


