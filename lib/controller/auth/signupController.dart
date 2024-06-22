// ignore_for_file: non_constant_identifier_names, avoid_print, file_names

import 'package:Tasawe7/controller/auth/Bar2Controller.dart';
import 'package:Tasawe7/controller/core/function/handlingData.dart';
import 'package:Tasawe7/controller/core/function/statusrequest.dart';
import 'package:Tasawe7/controller/data/remote/auth/signup.dart';
import 'package:Tasawe7/view/screen/login.dart';
import 'package:Tasawe7/view/screen/suggestions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SignupController extends GetxController {
  signUp();
  goToLogIn();
}

class SignupControllerImp extends SignupController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmpassword;
  late TextEditingController phone;
  late TextEditingController address;

  late StatusRequest statusRequest;
  SignupData signupData = SignupData(Get.find());
  Bar2Controller bar2controller = Get.find();

  List data = [];
  savePref(
    String id1,
    String name1,
    String email1,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString("id", id1);
    preferences.setString("name", name1);
    preferences.setString("email", email1);
    print(preferences.getString("name"));
    print(preferences.getString("supports"));
  }

  @override
  signUp() async {
    final token = await FirebaseMessaging.instance.getToken();
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await signupData.postData(name.text, email.text,
          password.text, phone.text, address.text, token);
      print("------------------> $response");

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          savePref(
            response['id'].toString(),
            response['name'],
            response['email'],
          );
          await Get.defaultDialog(
              title: " ", middleText: "تم إنشاء الحساب بنجاح");
          bar2controller.onInit();
          Get.off(() => Suggestions());
        } else {
          Get.defaultDialog(
              title: "تحذير", middleText: "رقم الهاتف او البريد موجود بالفعل");
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
  goToLogIn() {
    Get.off(() => Login());
  }

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    address = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    address.dispose();

    super.dispose();
  }
}
