// ignore_for_file: file_names

import 'package:Tasawe7/controller/auth/Bar2Controller.dart';
import 'package:Tasawe7/controller/core/constants/color.dart';
import 'package:Tasawe7/view/screen/login.dart';
import 'package:Tasawe7/view/screen/suggestions.dart';
import 'package:Tasawe7/view/widget/compnent/Button.dart';
import 'package:Tasawe7/view/widget/compnent/exitdialog.dart';
import 'package:Tasawe7/view/widget/compnent/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bar2 extends StatelessWidget {
  final String title;
  final Widget child;

  const Bar2({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Bar2Controller controller = Get.find();
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    controller.getPref();
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        // Return false to indicate that you handled the back button press
        return Future.value(false);
      },
      child: Scaffold(
        primary: false,
        extendBodyBehindAppBar: true,
        backgroundColor: isDark
            ? AppColor.ColorAppBarBackGraoundB
            : AppColor.ColorAppBarBackGraound,
        appBar: AppBar(
          actions: const [
            Icon(Icons.abc_outlined, color: Colors.transparent, size: 10),
          ],
          primary: false,
          title: Obx(() => controller.user.value == 1
              ? Directionality(
                  textDirection: TextDirection.rtl,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                              fontFamily: "Beyonders",
                              color: isDark
                                  ? AppColor.ColorTextB
                                  : AppColor.ColorText,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Txt(
                                text: controller.name.value,
                                size: 14,
                                color: isDark
                                    ? AppColor.ColorTextB
                                    : AppColor.ColorText,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Txt(
                                text: "عدد المساهمات :",
                                size: 14,
                                color: isDark
                                    ? AppColor.ColorTextB
                                    : AppColor.ColorText,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Txt(
                                text: controller.supports.value,
                                size: 14,
                                color: isDark
                                    ? AppColor.ColorTextB
                                    : AppColor.ColorText,
                              ),
                            ],
                          ),
                        ]),
                  ))
              : Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Beyonders",
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
                  ),
                )),
          centerTitle: true,
          toolbarHeight: h / 3.5,
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(100),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(100),
          )),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0),
                bottomRight: Radius.circular(100),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(100),
              ),
              gradient: LinearGradient(
                  begin: isDark ? Alignment.centerLeft : Alignment.topCenter,
                  end: isDark ? Alignment.centerRight : Alignment.bottomCenter,
                  colors:
                      isDark ? AppColor.ColorAppBarB : AppColor.ColorAppBar),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? AppColor.ColorConShadowB
                      : AppColor.ColorConShadow,
                  blurRadius: 15,
                ),
              ],
            ),
            child: Obx(() => controller.user.value == 1
                ? Stack(
                    children: [
                      Positioned(
                        top: 50,
                        // left: 20,
                        right: 30,
                        child: Button2(
                            verticalPadding: 0,
                            horizontalPadding: 0,
                            realHeight: 45,
                            isTappedHeight: 40,
                            realWidth: 45,
                            isTappedWidth: 40,
                            color1: const Color.fromARGB(255, 27, 27, 27),
                            color2: const Color.fromARGB(255, 132, 15, 15),
                            widget1: const Icon(
                              Icons.power_settings_new_outlined,
                              color: Color.fromRGBO(248, 20, 3, 1),
                              size: 40,
                            ),
                            onTap: (() async {
                              showLogOutPopup(context);
                            })),
                      )
                    ],
                  )
                : SizedBox(
                    width: w,
                    height: h,
                  )),
          ),
        ),
        floatingActionButton: Container(
          padding: const EdgeInsets.all(8),
          // margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isDark ? AppColor.ColorConB : AppColor.ColorConW,
            ),
            boxShadow: [
              BoxShadow(
                color:
                    isDark ? AppColor.ColorConShadowB : AppColor.ColorConShadow,
                blurRadius: 10,
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(200),
            ),
          ),
          child: Material(
            color: const Color.fromARGB(0, 64, 233, 255),
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(200),
              ),
              highlightColor: const Color.fromARGB(255, 36, 156, 254),
              splashColor: const Color.fromARGB(255, 36, 149, 254),
              onTap: () {
                Get.to(() =>
                    controller.loading.value == 1 ? Suggestions() : Login());
              },
              child: Icon(
                CupertinoIcons.chat_bubble_fill,
                size: 40,
                color: isDark
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(181, 240, 240, 240),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isDark
                      ? AppColor.ColorBackGroundB
                      : AppColor.ColorBackGround,
                )),
                child: child),
          ],
        ),
      ),
    );
  }
}
