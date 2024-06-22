// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names, unused_local_variable, library_prefixes, avoid_print

import 'package:Tasawe7/controller/core/class/handlingDataView.dart';
import 'package:flutter/material.dart';
import 'package:Tasawe7/view/widget/compnent/Bar.dart';
import 'package:Tasawe7/view/widget/compnent/TSNList.dart';
import 'package:get/get.dart';

import '../../controller/auth/tsnController.dart';



class TSN extends StatelessWidget {
  const TSN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        Get.put(TSNController());
    return   Bar4( 
      title: "ارقام الاعطال بالمحافظات" ,

        child: 
       GetBuilder<TSNController>(
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
                       TSNList(
                        gov_name:       item['gov_name'],
                        electric_num:   item['electric_num'],
                        gas_num:        item['water_num'],
                        water_num:      item['water_num'],

                      );
                      },
                  
          )
          );
        },
      ),
      );
        
  }
}
