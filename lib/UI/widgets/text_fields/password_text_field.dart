import 'package:authentication/config/size_config.dart';
import 'package:authentication/constrants/text_field_decoration.dart';
import 'package:authentication/utils/colors.dart';
import 'package:authentication/utils/utils.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    this.textFieldFilled = true,
  });
  final TextEditingController controller;
  final bool? textFieldFilled;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _textVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 3,
          ),
          child: Text(
            'Password',
            style: TextStyle(
              color: blackColor,
              fontWeight: FontWeight.w400,
              fontSize: SizeConfig.font12(context) + 1,
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.width8(context),
        ),
        TextFormField(
          validator: (value) => Utils.passwordValidator(value),
          textInputAction: TextInputAction.done,
          obscureText: _textVisible,
          controller: widget.controller,
          decoration: TextFieldDecoration.kPasswordFieldDecoration.copyWith(
            filled: widget.textFieldFilled,
            fillColor: textFieldFillColor,
            hintText: 'Password mini 8 characters',
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _textVisible = !_textVisible;
                  });
                },
                icon: _textVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility)),
          ),
        ),
      ],
    );
  }
}
