// ignore_for_file: non_constant_identifier_names, avoid_print, file_names

import 'dart:convert';

import 'package:Tasawe7/controller/core/function/handlingData.dart';
import 'package:Tasawe7/controller/core/function/statusrequest.dart';
import 'package:Tasawe7/controller/data/remote/auth/inquiry.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InquiryController extends GetxController {
  List<Map<String, dynamic>> data = [];

  InquiryData inquiryData = InquiryData(Get.find());
  late StatusRequest statusRequest;

  // تخزين البيانات في SharedPreferences
  Future<void> savePref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList(
      'inquiryData',
      data.map((item) => item.toString()).toList(),
    );
  }

  // جلب البيانات من SharedPreferences
  Future<void> loadPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? jsonStringList = preferences.getStringList('inquiryData');
    if (jsonStringList != null) {
      data = jsonStringList
          .map((item) => jsonDecode(item) as Map<String, dynamic>)
          .toList();
      update();
    }
  }

  Future getData() async {
    statusRequest = StatusRequest.loading;
    var response = await inquiryData.getData();

    print("------------------> $response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var dataList = response['data'];

        for (var item in dataList) {
          var id = item['ID'];
          var inquiry = item['Inquiry'];
          var details = item['Details'];
          var addedDate = item['Added_Date'];

          print(
              "ID: $id, Inquiry: $inquiry, Details: $details, Added_Date: $addedDate");

          data.add({
            'ID': id,
            'Inquiry': inquiry,
            'Details': details,
            'Added_Date': addedDate,
          });

          savePref(); // حفظ البيانات في SharedPreferences
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    loadPref(); // جلب البيانات من SharedPreferences عند بدء التطبيق
    getData();
    super.onInit();
  }
}
