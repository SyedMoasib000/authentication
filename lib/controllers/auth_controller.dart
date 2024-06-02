// ignore_for_file: use_build_context_synchronously

import 'package:authentication/UI/screens/Login/sign_in.dart';
import 'package:authentication/UI/screens/Welcome/welcome.dart';
import 'package:authentication/respositories/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final AuthRepository _authRepository = AuthRepository();

  Future<void> registerUser(BuildContext context) async {
    try {
      await _authRepository.signUp(email.text.trim(), password.text.trim());
      Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const SignIn()));
    } catch (e) {
      // Handle registration failure (show error message, etc.)
    }
  }

  Future<void> loginUser(BuildContext context) async {
    try {
      await _authRepository.signIn(email.text.trim(), password.text.trim());
      // Navigate to the next screen upon successful login
      Navigator.pushReplacement(
        // ignore: duplicate_ignore
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
            builder: (context) =>
                const WelcomeScreen()), // Replace NextScreen() with the actual screen you want to navigate to
      );
    } catch (e) {
      // Handle login failure (show error message, etc.)
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await _authRepository.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const SignIn()), // Replace NextScreen() with the actual screen you want to navigate to
      );
    } catch (e) {}
  }
}
