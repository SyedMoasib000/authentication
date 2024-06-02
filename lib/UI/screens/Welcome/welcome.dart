import 'package:authentication/controllers/auth_controller.dart';
import 'package:authentication/utils/colors.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = AuthController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
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
              icon: Icon(Icons.logout)),
        ),
      ),
    );
  }
}
