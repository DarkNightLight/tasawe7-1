// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names, unused_local_variable, library_prefixes, avoid_print

import 'package:Tasawe7/controller/auth/webNewsController.dart';
import 'package:Tasawe7/controller/core/class/handlingDataView.dart';
import 'package:Tasawe7/controller/core/constants/color.dart';
import 'package:Tasawe7/view/screen/newsScreen.dart';
import 'package:Tasawe7/view/widget/compnent/HomePageCard.dart';
import 'package:flutter/material.dart';
import 'package:Tasawe7/view/widget/compnent/Bar.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WebNews extends StatelessWidget {
  const WebNews({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.transparent
));


    final double screenHeigh = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Get.put(WebNewsController());
    return  Bar4( 
      title: "مواقع الاخبار" ,
       child: 
       GetBuilder<WebNewsController>(
            builder: (controller) {
            return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 1,
                crossAxisCount: 2,
              ),
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                var item = controller.data[index];
                return HomePageCard1(
                  color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
                  context: context,
                  route: () {
                    HapticFeedback.lightImpact();
                    Get.to(NewsScreen( title: "${item['title']}" , link: "${item['link']}"  )  );
                  },
                  title: "${item['title']}",
                );
              },
            ),
          );
        },
      ),
      );
        
  }
}