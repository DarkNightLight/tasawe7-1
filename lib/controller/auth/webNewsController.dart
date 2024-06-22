// ignore_for_file: non_constant_identifier_names, avoid_print, file_names

import 'package:Tasawe7/controller/core/function/handlingData.dart';
import 'package:Tasawe7/controller/core/function/statusrequest.dart';
import 'package:Tasawe7/controller/data/remote/auth/webNews.dart';
import 'package:get/get.dart';

class WebNewsController extends GetxController {
  List<Map<String, dynamic>> data = [];

  WebNewsData webNewsData = WebNewsData(Get.find());



  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await webNewsData.getData();

    print("------------------> $response");

    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var dataList = response['data'];

        if (dataList != null) {
          for (var item in dataList) {
            var title = item['title'];
            var link  = item['link'];
            
            

            print("link: $link  \n  title: $title");

            data.add({
              'title': title,
              'link':  link,
            });

            // savePref(em_name, em_number);
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
