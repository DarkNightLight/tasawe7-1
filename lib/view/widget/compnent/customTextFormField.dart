// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  final String svgIcon;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? myController;
  final String? Function(String?) valid;
  final IconButton? suffixIcon;
  const CustomTextFormField({
    Key? key,
    required this.svgIcon,
    required this.hintText,
    required this.labelText,
    required this.myController,
    required this.valid,
    this.keyboardType,
    required this.obscureText,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      keyboardType: keyboardType,
      validator: valid,
      obscureText: obscureText,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Color(0xff2F3D75), width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Color(0xff2F3D75), width: 2.0),
        ),
        labelText: labelText,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(20),
          child: SvgPicture.asset(
            svgIcon,
            height: 16,
            width: 16,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
