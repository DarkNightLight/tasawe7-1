// ignore_for_file: non_constant_identifier_names, avoid_print, file_names


import 'package:Tasawe7/controller/core/function/handlingData.dart';
import 'package:Tasawe7/controller/core/function/statusrequest.dart';
import 'package:Tasawe7/controller/data/remote/auth/tsn.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TSNController extends GetxController {
  List<Map<String, dynamic>> data = [];

  TSNData tsnData = TSNData(Get.find());

  savePref(
    var gov_name,
    var electric_num,
    var water_num,
    var gas_num,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("gov_name", gov_name);
    preferences.setString("electric_num", electric_num);
    preferences.setString("water_num", water_num);
    preferences.setString("gas_num", gas_num);
  }

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await tsnData.getData();

    print("------------------> $response");

    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var dataList = response['data'];

        if (dataList != null) {
          for (var item in dataList) {
            var id = item['gov_id'];
            var gov_name = item['gov_name'];
            var electric_num = item['electric_num'];
            var water_num = item['water_num'];
            var gas_num = item['gas_num'];

            print("ID: $id, gov_name: $gov_name, electric_num: $electric_num, water_num: $water_num, gas_num: $gas_num");

            data.add({
              'ID': id,
              'gov_name': gov_name,
              'electric_num': electric_num,
              'water_num': water_num,
              'gas_num': gas_num,
            });

            savePref(gov_name, electric_num, water_num, gas_num);
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
