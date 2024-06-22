// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names, unused_local_variable, library_prefixes, avoid_print

import 'package:Tasawe7/controller/auth/emergencyController.dart';
import 'package:Tasawe7/controller/core/class/handlingDataView.dart';
import 'package:flutter/material.dart';
import 'package:Tasawe7/view/widget/compnent/Bar.dart';
import 'package:Tasawe7/view/widget/compnent/EmergencyList.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Emergency extends StatelessWidget {
  const Emergency({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.transparent
));


    final double screenHeigh = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Get.put(EmergencyController());
    return  Bar4( 
      title: "ارقام الطوارئ" ,
       child: 
       GetBuilder<EmergencyController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: 
            ListView.builder(
              physics:  BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                var item = controller.data[index];
                return 
                    EmergencyList(
                      route:       item["em_number"] ,
                      em_name:     item["em_name"],
                      em_number:   item['em_number'],
                    );
                })
      ) ;
  })
      );
        
  }
}