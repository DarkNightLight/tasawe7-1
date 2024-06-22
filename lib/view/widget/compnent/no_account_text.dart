// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:Tasawe7/controller/core/constants/color.dart';

class NoAccountText extends StatelessWidget {
  final textone;
  final texttwo;
  final Function() onTap;
  NoAccountText({
    Key? key,
    this.textone,
    this.texttwo,

    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textone,
              style: TextStyle(
                  fontSize: 16,
                  color: isDark ? AppColor.ColorTextB : Colors.black),
            ),
            Expanded(
              child: GestureDetector(
                onTap: onTap,
                child: Text(
                  texttwo,
                  overflow: TextOverflow.fade,
                  style:
                      const TextStyle(fontSize: 16, color: AppColor.txtButton),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
