import 'package:authentication/UI/screens/Login/sign_in.dart';
import 'package:authentication/UI/widgets/custom_button.dart';
import 'package:authentication/UI/widgets/text_fields/password_text_field.dart';
import 'package:authentication/UI/widgets/text_fields/text_form_field_widget.dart';
import 'package:authentication/config/size_config.dart';
import 'package:authentication/controllers/auth_controller.dart';
import 'package:authentication/utils/colors.dart';
import 'package:authentication/utils/utils.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    // final _formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          children: [
            SizedBox(
              width: SizeConfig.width(context),
              height: SizeConfig.height(context) / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let's Start",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: SizeConfig.font28(context),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Create an account",
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.pad24(context)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormFieldWidget(
                          controller: _authController.name,
                          validator: (value) => Utils.nameValidator(value),
                          label: "Full Name",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormFieldWidget(
                          controller: _authController.email,
                          validator: (value) => Utils.nameValidator(value),
                          label: "Email",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PasswordTextField(
                          controller: _authController.password,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                          txt: "Sign Up",
                          btnColor: primaryColor,
                          onpressed: () =>
                              _authController.registerUser(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            TextButton(
                              onPressed: () => signIn(context),
                              child: const Text(
                                "Sign In",
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

  void signIn(BuildContext context) {
    setState(() {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext) => const SignIn()));
    });
  }
}
