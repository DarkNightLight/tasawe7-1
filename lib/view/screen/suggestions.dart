// ignore_for_file: prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, prefer_const_constructors, unnecessary_new, avoid_print, non_constant_identifier_names, prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:Tasawe7/controller/auth/suggestionController.dart';
import 'package:Tasawe7/view/widget/compnent/Button.dart';
import 'package:Tasawe7/view/widget/compnent/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Tasawe7/controller/core/constants/color.dart';
import '../widget/compnent/Bar.dart';

class Suggestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    SuggestionControllerInp controller = Get.put(SuggestionControllerInp());

    return Bar5(
        title: "الاقتراحات",
        child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Stack(
              children: [
                Center(
                    child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: isDark
                                  ? AppColor.ColorResponsiveButtonShadowB
                                  : AppColor.ColorResponsiveButtonShadow,
                              blurRadius: 20.0),
                        ],
                        color: isDark
                            ? AppColor.ColorTxtFieldBoxDecB
                            : AppColor.ColorTxtFieldBoxDec,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Form(
                        key: controller.formstate,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          maxLines: null,
                          validator: (val) {
                            if (val!.trim().isEmpty) {
                              return "برجاء كتابة التعديل أو الإقتراح قبل الضغط على تسجيل الإقتراح";
                            }
                            return null;
                          },
                          style: TextStyle(
                              color: isDark
                                  ? AppColor.ColorTxtFieldinputLogB
                                  : AppColor.ColorTxtFieldinputLog),
                          cursorColor: isDark
                              ? AppColor.ColorTxtFieldinputLogB
                              : AppColor.ColorTxtFieldinputLog,
                          controller: controller.content,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            errorStyle: TextStyle(color: Colors.red),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(47, 61, 117, 0),
                                  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(0, 0, 0, 0),
                                  width: 2.0),
                            ),
                            // isDense: true,
                            contentPadding: EdgeInsets.all(10),
                            hintMaxLines: 1,
                            hintText: "برجاء كتابة التعديل أو الإقتراح ",
                            hintStyle: TextStyle(
                              color: isDark
                                  ? AppColor.ColorTxtFieldinputLogB
                                  : AppColor.ColorTxtFieldinputLog,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Button(
                        title: "إرسال الإقتراح",
                        // hight: w / 3,
                        // width: w / 2,
                        verticalPadding: w / 15,
                        horizontalPadding: 5,
                        realHeight: w / 9,
                        isTappedHeight: w / 10,
                        realWidth: w / 2,
                        isTappedWidth: w / 2.8,
                        onTap: (() {
                          KeyboardUtil.hideKeyboard(context);
                          controller.insert();
                        })),
                  ]),
                )),
              ],
            )));
  }
}
