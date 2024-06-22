// ignore_for_file: non_constant_identifier_names, avoid_print, file_names, unused_field, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:Tasawe7/controller/auth/Bar2Controller.dart';
import 'package:Tasawe7/controller/core/function/handlingData.dart';
import 'package:Tasawe7/controller/core/function/statusrequest.dart';
import 'package:Tasawe7/controller/data/remote/auth/suggestion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SuggestionController extends GetxController {
  insert();
}

class SuggestionControllerInp extends SuggestionController {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController content;
  late FocusNode contentFocus;
  late StatusRequest statusRequest;
  SuggestionData suggestionData = SuggestionData(Get.find());
  List<Map<String, dynamic>> data = [];
  Bar2Controller bar2controller = Get.find();
  var user_email;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    user_email = preferences.getString("email");
  }

  final PageController _pageController = PageController();

  @override
  insert() async {
    if (formstate.currentState!.validate()) {
      formstate.currentState?.save();

      var statusRequest = StatusRequest.loading;
      var response = await suggestionData.postData(content.text, user_email);
      print("------------------> $response");

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          content.clear();

          // Dismiss the keyboard
          FocusScope.of(Get.context!).unfocus();

          contentFocus.canRequestFocus = false;

          await Get.defaultDialog(title: "تم", middleText: "شكرأ للمساعدة");
          update();
        }
      }
    } else {
      print("Not Valid");
    }

    update();
  }



  @override
  void onInit() {
    content = TextEditingController();
    contentFocus = FocusNode();
    getPref();
    super.onInit();
  }
}
