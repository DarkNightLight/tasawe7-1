// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:Tasawe7/controller/core/constants/appImage.dart';
import 'package:Tasawe7/controller/core/function/validInput.dart';
import 'package:Tasawe7/view/widget/compnent/Bar.dart';
import 'package:Tasawe7/view/widget/compnent/Button.dart';
import 'package:Tasawe7/view/widget/compnent/customTextFormField.dart';
import 'package:Tasawe7/view/widget/compnent/keyboard.dart';
import 'package:Tasawe7/view/widget/compnent/no_account_text.dart';
import 'package:Tasawe7/controller/auth/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'About.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    LoginControllerInp controller = Get.put(LoginControllerInp());
    return WillPopScope(
      onWillPop: () {
        Get.back();
        return Future.value(false);
      },
      child: Bar6(
        title: "تسجيل الدخول",
        child: Form(
          key: controller.formstate,
          child: Center(
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                            svgIcon: AppImage.mail,
                            hintText: "n******@gmail.com",
                            labelText: "الايميل",
                            myController: controller.email,
                            obscureText: false,
                            valid: (val) {
                              return validinput(val!, 5, 100, "email");
                            }),
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextFormField(
                            svgIcon: AppImage.lock,
                            hintText: "اكتب الرمز السري",
                            labelText: "الرمز السري",
                            myController: controller.password,
                            obscureText: !isVisible,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: !isVisible
                                    ? Icon(
                                        Icons.visibility_off_rounded,
                                        color: Colors.blue[300],
                                      )
                                    : Icon(
                                        Icons.visibility_rounded,
                                        color: Colors.red[400],
                                      )),
                            valid: (val) {
                              return validinput(val!, 6, 8, "password");
                            }),
                        const SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Center(
                            child: NoAccountText(
                              textone: "ليس لديك حساب ؟ ",
                              texttwo: "إنشاء حساب",
                              onTap: () {
                                controller.goToSignUp();
                              },
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => const About());
                          },
                          child: Text(
                            "سياسة الخصوصية و الإستخدام",
                            style: TextStyle(
                                fontFamily: "ElMessiri",
                                color: Colors.blue[400],
                                decoration: TextDecoration.underline,
                                fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Button(
                            title: "تسجيل الدخول",
                            verticalPadding: 0,
                            horizontalPadding: 0,
                            realHeight: w / 6,
                            isTappedHeight: w / 10,
                            realWidth: w / 1.9,
                            isTappedWidth: w / 2.8,
                            onTap: (() {
                              KeyboardUtil.hideKeyboard(context);
                              controller.login();
                            })),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
