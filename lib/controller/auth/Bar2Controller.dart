// ignore_for_file: file_names

import 'package:Tasawe7/controller/core/constants/api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Bar2Controller extends GetxController {
  var user = 0.obs;
  var loading = 0.obs;
  var name = ''.obs;
  var id = ''.obs;
  var supports = ''.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      user.value = 0;
      loading.value = 0;
      navigate();
      getPref();
    });
  }

  savePref(supports1) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("supports", supports1);
  }

  Future<void> getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    id.value = preferences.getString("id") ?? '';
    name.value = preferences.getString("name") ?? '';
    supports.value = preferences.getString("supports") ?? '';
    if (id.value != '' && id.value != 'null') {
      await getData();
    }
  }

  Future<void> getData() async {
    try {
      var url = Uri.parse('${Api.selectUserSupports}?id=${id.value}');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        if (responsebody is List && responsebody.isNotEmpty) {
          supports.value = responsebody[0]['supports'].toString();
          savePref(responsebody[0]['supports'].toString());
        } else {
          supports.value = '0'; // Or any default value you prefer
        }
      } else {
        // Handle server response error
        supports.value = '0'; // Or any default value you prefer
      }
    } catch (e) {
      supports.value = '0'; // Or any default value you prefer
    }
  }

  void navigate() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.getString("email");
      var userId = preferences.getString("id");
      if (userId != null) {
        loading.value = 1;
        id.value = userId;
        name.value = preferences.getString("name") ?? '';
        supports.value = preferences.getString("supports") ?? '';
      } else {
        loading.value = 2;
      }
    } catch (ex) {
      loading.value = 2;
    }
    if (id.value.isNotEmpty) {
      user.value = 1;
    }
  }

  void clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    await preferences.remove("id");
    await preferences.remove("name");
    await preferences.remove("email");
    await preferences.remove("supports");
    onClose();
    id.value = "";
    name.value = "";
    supports.value = "";
    onInit();
    Get.back();
    // Get.off(const HomePage());
  }
}
