// ignore_for_file: non_constant_identifier_names, avoid_print, file_names, unused_field, unused_local_variable

import 'package:Tasawe7/controller/auth/Bar2Controller.dart';
import 'package:Tasawe7/controller/core/function/handlingData.dart';
import 'package:Tasawe7/controller/core/function/statusrequest.dart';
import 'package:Tasawe7/controller/data/remote/auth/login.dart';
import 'package:Tasawe7/view/screen/signUp.dart';
import 'package:Tasawe7/view/screen/suggestions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
}

class LoginControllerInp extends LoginController {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  late StatusRequest statusRequest;
  LoginData loginData = LoginData(Get.find());
  Bar2Controller bar2controller = Get.find();
  List<Map<String, dynamic>> data = [];

  savePref(
    String id1,
    String name1,
    String email1,
    String supports1,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString("id", id1);
    preferences.setString("name", name1);
    preferences.setString("email", email1);
    preferences.setString("supports", supports1);
    print(preferences.getString("name"));
    print(preferences.getString("supports"));
  }

  final PageController _pageController = PageController();

  @override
  login() async {
    final token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      print(">>>>>>>>>>>>>>>>>>>>" + token);
    }

    if (formstate.currentState!.validate()) {
      formstate.currentState?.save();
      var statusRequest = StatusRequest.loading;
      var response = await loginData.postData(email.text, password.text, token);
      print("------------------> $response");

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          savePref(
            response['id'].toString(),
            response['name'],
            response['email'],
            response['supports'].toString(),
          );
          bar2controller.onInit();
          Get.off(() => Suggestions());
          Get.defaultDialog(title: " ", middleText: "تم تسجيل الدخول بنجاح");

          update();
        } else {
          Get.defaultDialog(
              title: "تحذير", middleText: "هناك خطأ في البريد او كلمة المرور");
          statusRequest = StatusRequest.failure;
        }
      }

      print("Valid");
    } else {
      print("Not Valid");
    }
    update();
  }

  @override
  goToSignUp() {
    Get.off(() => const SignUp());
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
