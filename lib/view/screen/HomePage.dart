// ignore_for_file: file_names


import 'package:Tasawe7/controller/auth/Bar2Controller.dart';
import 'package:Tasawe7/controller/core/constants/appImage.dart';
import 'package:Tasawe7/view/screen/Emergency.dart';
import 'package:Tasawe7/view/screen/MasrScreen.dart';
import 'package:Tasawe7/view/screen/webNews.dart';
import 'package:Tasawe7/view/widget/compnent/Bar2.dart';
import 'package:Tasawe7/view/widget/compnent/exitdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:Tasawe7/controller/core/constants/color.dart';
import 'package:Tasawe7/view/screen/Inquiry.dart';
import '../widget/compnent/HomePageCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    Bar2Controller bar2controller = Get.put(Bar2Controller());
    bar2controller.onInit();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    // return Obx(() {
    // bar2controller.loading.value;
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Bar2(
        title: "Tasawe7",
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: GridView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 15, crossAxisCount: 2, mainAxisSpacing: 15),
            children: <Widget>[
              HomePageCard2(
                  icon: SvgPicture.asset(
                    AppImage.guide1,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
                  context: context,
                  route: () {
                    Get.to(const Inquiry());
                  },
                  title: "ارشادات خدمات المواطنين"),
              HomePageCard2(
                  icon: SvgPicture.asset(
                    AppImage.emergency,
                    height: 90,
                  ),
                  color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
                  context: context,
                  route: () {
                    Get.to(const Emergency());
                  },
                  title: "ارقام الطوارئ"),
              HomePageCard2(
                  //  icon: CupertinoIcons.device_laptop ,
                  icon: SvgPicture.asset(
                    AppImage.masr,
                    height: 90,
                  ),
                  color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
                  context: context,
                  route: () {
                    Get.to(const MasrScreen());
                  },
                  title: "منصة مصر الرقمية"),
              HomePageCard2(
                  icon: SvgPicture.asset(
                    AppImage.news,
                    height: 90,
                  ),
                  color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
                  context: context,
                  route: () {
                    Get.to(const WebNews());
                  },
                  title: "المواقع الإخبارية"),
            ],
          ),
        ),
      ),
    );
    // });
  }
}
