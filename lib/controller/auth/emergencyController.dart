// ignore_for_file: non_constant_identifier_names, avoid_print, file_names

import 'package:Tasawe7/controller/core/function/handlingData.dart';
import 'package:Tasawe7/controller/core/function/statusrequest.dart';
import 'package:Tasawe7/controller/data/remote/auth/emergency.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmergencyController extends GetxController {
  List<Map<String, dynamic>> data = [];

  EmergencyData emergencyData = EmergencyData(Get.find());

  savePref(
    var em_name,
    var em_number,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("em_name", em_name);
    preferences.setString("em_number", em_number);
  }

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await emergencyData.getData();

    print("------------------> $response");

    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var dataList = response['data'];

        if (dataList != null) {
          for (var item in dataList) {
            var id = item['em_id'];
            var em_name = item['em_name'];
            var em_number = item['em_number'];

            print("ID: $id, em_name: $em_name, em_number: $em_number,");

            data.add({
              'ID': id,
              'em_name': em_name,
              'em_number': em_number,
            });

            savePref(em_name, em_number);
          }
        } else {
          print("Error: 'data' is null in the response.");
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
