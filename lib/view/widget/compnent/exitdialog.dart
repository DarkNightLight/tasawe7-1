import 'dart:io';
import 'package:Tasawe7/controller/auth/Bar2Controller.dart';
import 'package:Tasawe7/controller/core/constants/color.dart';
import 'package:Tasawe7/view/widget/compnent/Button.dart';
import 'package:Tasawe7/view/widget/compnent/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> showLogOutPopup(context) async {
  Bar2Controller bar2controller = Get.find();
  bool isDark = Theme.of(context).brightness == Brightness.dark;
  return await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          backgroundColor: const Color.fromARGB(115, 0, 0, 0),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          content: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Txt(
                      size: 14,
                      color: isDark
                          ? AppColor.ColorResponsiveButtonTxTB
                          : AppColor.ColorResponsiveButtonTxT,
                      text: "هل تود تسجيل الخروج من التطبيق ؟"),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button3(
                            verticalPadding: 0,
                            horizontalPadding: 0,
                            realHeight: 70,
                            isTappedHeight: 50,
                            realWidth: 100,
                            isTappedWidth: 80,
                            color1: const Color(0xff2F3D75),
                            color2: const Color(0xFF59CAEF),
                            highlightColor:
                                const Color.fromARGB(255, 36, 149, 254),
                            splashColor:
                                const Color.fromARGB(255, 36, 149, 254),
                            shadow: isDark
                                ? AppColor.ColorResponsiveButtonShadowB
                                : AppColor.ColorResponsiveButtonShadow,
                            widget1: Txt(
                                size: 14,
                                color: isDark
                                    ? AppColor.ColorResponsiveButtonTxTB
                                    : AppColor.ColorResponsiveButtonTxT,
                                text: "لا"),
                            onTap: (() async {
                              Get.back();
                              // controller.clearUserData();
                            })),
                        Button3(
                            verticalPadding: 0,
                            horizontalPadding: 0,
                            realHeight: 70,
                            isTappedHeight: 50,
                            realWidth: 100,
                            isTappedWidth: 80,
                            color1: const Color.fromARGB(255, 27, 27, 27),
                            color2: const Color.fromARGB(255, 132, 15, 15),
                            highlightColor:
                                const Color.fromARGB(255, 61, 19, 19),
                            splashColor: const Color.fromARGB(255, 78, 28, 24),
                            shadow: Colors.red,
                            widget1: Txt(
                                size: 14,
                                color: isDark
                                    ? AppColor.ColorResponsiveButtonTxTB
                                    : AppColor.ColorResponsiveButtonTxT,
                                text: "نعم"),
                            onTap: (() async {
                              bar2controller.clearUserData();
                            })),
                      ]),
                ],
              ))));
}

Future<bool> showExitPopup(context) async {
  // ignore: unused_local_variable
  Bar2Controller bar2controller = Get.find();
  bool isDark = Theme.of(context).brightness == Brightness.dark;
  return await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          backgroundColor: const Color.fromARGB(115, 0, 0, 0),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          content: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Txt(
                      size: 14,
                      color: isDark
                          ? AppColor.ColorResponsiveButtonTxTB
                          : AppColor.ColorResponsiveButtonTxT,
                      text: "هل تود الخروج من التطبيق ؟"),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button3(
                            verticalPadding: 0,
                            horizontalPadding: 0,
                            realHeight: 70,
                            isTappedHeight: 50,
                            realWidth: 100,
                            isTappedWidth: 80,
                            color1: const Color(0xff2F3D75),
                            color2: const Color(0xFF59CAEF),
                            highlightColor:
                                const Color.fromARGB(255, 36, 149, 254),
                            splashColor:
                                const Color.fromARGB(255, 36, 149, 254),
                            shadow: isDark
                                ? AppColor.ColorResponsiveButtonShadowB
                                : AppColor.ColorResponsiveButtonShadow,
                            widget1: Txt(
                                size: 14,
                                color: isDark
                                    ? AppColor.ColorResponsiveButtonTxTB
                                    : AppColor.ColorResponsiveButtonTxT,
                                text: "لا"),
                            onTap: (() async {
                              Get.back();
                              // controller.clearUserData();
                            })),
                        Button3(
                            verticalPadding: 0,
                            horizontalPadding: 0,
                            realHeight: 70,
                            isTappedHeight: 50,
                            realWidth: 100,
                            isTappedWidth: 80,
                            color1: const Color.fromARGB(255, 27, 27, 27),
                            color2: const Color.fromARGB(255, 132, 15, 15),
                            highlightColor:
                                const Color.fromARGB(255, 61, 19, 19),
                            splashColor: const Color.fromARGB(255, 78, 28, 24),
                            shadow: Colors.red,
                            widget1: Txt(
                                size: 14,
                                color: isDark
                                    ? AppColor.ColorResponsiveButtonTxTB
                                    : AppColor.ColorResponsiveButtonTxT,
                                text: "نعم"),
                            onTap: (() async {
                              exit(0);
                            })),
                      ]),
                ],
              ))));
}
