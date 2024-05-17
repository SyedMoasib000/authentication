import 'package:authentication/UI/screens/Login/sign_in.dart';
import 'package:authentication/UI/widgets/custom_button.dart';
import 'package:authentication/UI/widgets/text_fields/password_text_field.dart';
import 'package:authentication/UI/widgets/text_fields/text_form_field_widget.dart';
import 'package:authentication/config/size_config.dart';
import 'package:authentication/utils/colors.dart';
import 'package:authentication/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController user = TextEditingController();

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
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.pad24(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      TextFormFieldWidget(
                        controller: user,
                        validator: (value) => Utils.nameValidator(value),
                        label: "Full Name",
                      ),
                      TextFormFieldWidget(
                        controller: user,
                        validator: (value) => Utils.nameValidator(value),
                        label: "Email",
                      ),
                      PasswordTextField(controller: user),
                      const CustomButton(
                          txt: "Sign Up", btnColor: primaryColor),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: () => signIn(context),
                            child: Text(
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
          ],
        ),
      ),
    );
  }

  void signIn(BuildContext context) {
    setState(() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext) => SignIn()));
    });
  }
}
