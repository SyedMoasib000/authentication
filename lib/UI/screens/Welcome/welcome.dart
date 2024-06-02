import 'package:authentication/controllers/auth_controller.dart';
import 'package:authentication/utils/colors.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final AuthController _authController = AuthController();
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home Screen",
            style: TextStyle(color: whiteColor),
          ),
          backgroundColor: primaryColor,
        ),
        backgroundColor: whiteColor,
        body: Center(
          child: IconButton(
              onPressed: () => {
                    _authController.logout(context),
                  },
              icon: const Icon(Icons.logout)),
        ),
      ),
    );
  }
}
