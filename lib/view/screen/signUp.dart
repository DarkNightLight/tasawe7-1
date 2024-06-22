// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, sized_box_for_whitespace

import 'package:Tasawe7/controller/auth/signupController.dart';
import 'package:Tasawe7/controller/core/constants/appImage.dart';
import 'package:Tasawe7/controller/core/function/validInput.dart';
import 'package:Tasawe7/view/screen/login.dart';
import 'package:Tasawe7/view/widget/compnent/Bar.dart';
import 'package:Tasawe7/view/widget/compnent/Button.dart';
import 'package:Tasawe7/view/widget/compnent/customTextFormField.dart';
import 'package:Tasawe7/view/widget/compnent/keyboard.dart';
import 'package:Tasawe7/view/widget/compnent/no_account_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    SignupControllerImp controller = Get.put(SignupControllerImp());
    return WillPopScope(
      onWillPop: () {
        Get.off(() => Login());
        return Future.value(false);
      },
      child: Bar6(
        title: "إنشاء حساب",
        child: Form(
          key: controller.formstate,
          child: SafeArea(
            child: Container(
              height: h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      CustomTextFormField(
                          svgIcon: AppImage.user,
                          hintText: "اكتب الاسم",
                          labelText: "الاسم",
                          myController: controller.name,
                          obscureText: false,
                          valid: (val) {
                            return validinput(val!, 5, 50, "username");
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          svgIcon: AppImage.mail,
                          hintText: "n******@gmail.com",
                          labelText: "الايميل",
                          myController: controller.email,
                          obscureText: false,
                          valid: (val) {
                            return validinput(val!, 10, 100, "email");
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          svgIcon: AppImage.lock,
                          hintText: "اكتب الرمز السري",
                          labelText: "الرمز السري",
                          myController: controller.password,
                          obscureText: false,
                          valid: (val) {
                            return validinput(val!, 6, 8, "password");
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          svgIcon: AppImage.phone,
                          hintText: "اكتب رقم الموبايل",
                          labelText: "رقم الموبايل",
                          myController: controller.phone,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          valid: (val) {
                            return validinput(val!, 11, 11, "phone");
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          svgIcon: AppImage.locationpoint,
                          hintText: "اكتب العنوان",
                          labelText: "العنوان",
                          myController: controller.address,
                          obscureText: false,
                          valid: (val) {
                            return validinput(val!, 5, 100, "address");
                          }),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Center(
                          child: NoAccountText(
                            textone: "لديك حساب بالفعل ؟",
                            texttwo: "  تسجيل الدخول ",
                            onTap: () {
                              controller.goToLogIn();
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Button(
                          title: "انشاء حساب",
                          verticalPadding: 0,
                          horizontalPadding: 0,
                          realHeight: w / 6,
                          isTappedHeight: w / 10,
                          realWidth: w / 1.9,
                          isTappedWidth: w / 2.8,
                          onTap: (() async {
                            KeyboardUtil.hideKeyboard(context);
                            controller.signUp();
                          })),
                    ],
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
