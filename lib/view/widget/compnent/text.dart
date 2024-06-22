// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  String text;
  double size;
  Color color;
  Txt({
    Key? key,
    required this.text,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontFamily: "ElMessiri",
        fontSize: size,
        color: color,
      ),
    );
  }
}
