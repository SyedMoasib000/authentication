import 'package:authentication/UI/screens/Registeration/signup.dart';
import 'package:authentication/UI/widgets/custom_button.dart';
import 'package:authentication/UI/widgets/text_fields/password_text_field.dart';
import 'package:authentication/UI/widgets/text_fields/text_form_field_widget.dart';
import 'package:authentication/config/size_config.dart';
import 'package:authentication/controllers/auth_controller.dart';
import 'package:authentication/utils/colors.dart';
import 'package:authentication/utils/utils.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          children: [
            Container(
              width: SizeConfig.width(context),
              height: SizeConfig.height(context) / 4,
              color: primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: SizeConfig.font28(context),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Sign in to your account",
                    style: TextStyle(color: whiteColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: SizeConfig.width(context),
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.pad24(context)),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign In",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormFieldWidget(
                          controller: _authController.email,
                          validator: (value) => Utils.nameValidator(value),
                          label: "Your Email",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        PasswordTextField(controller: _authController.password),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Remember me"),
                            TextButton(
                              onPressed: null,
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(color: primaryColor),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                            txt: "Sign In",
                            btnColor: primaryColor,
                            onpressed: ()=>_authController.loginUser(context)),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("I'm a new user"),
                            TextButton(
                              onPressed: () => signUp(context),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(color: primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUp(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext) => const SignUp()));
  }
}
