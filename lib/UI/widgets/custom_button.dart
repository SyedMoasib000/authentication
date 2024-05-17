import 'package:authentication/config/size_config.dart';
import 'package:authentication/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.txt,
    required this.btnColor,
  });
  final String txt;
  final Color btnColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.width(context),
      child: TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(13), backgroundColor: btnColor),
          onPressed: null,
          child: Text(
            txt,
            style: const TextStyle(
                color: whiteColor, fontSize: 21, fontWeight: FontWeight.bold),
          )),
    );
  }
}
