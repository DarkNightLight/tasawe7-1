// ignore_for_file: file_names

import 'package:Tasawe7/controller/core/constants/appImage.dart';
import 'package:Tasawe7/controller/core/function/statusrequest.dart';
import 'package:Tasawe7/view/widget/compnent/SpinningCircler.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: SpinningCircler(),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AppImage.error,
                        repeat: true, reverse: true, height: 200),
                    Text(
                      "لا يوجد إتصال بالشبكة",
                      style: TextStyle(color: isDark ? Colors.red : Colors.red),
                    )
                  ],
                ),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(AppImage.error404,
                            repeat: true, reverse: true, height: 300),
                        Text(
                          "يوجد عطل بالخادم و جاري إصلاح العطل",
                          style: TextStyle(
                              color: isDark
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : const Color.fromARGB(255, 0, 0, 0)),
                        )
                      ],
                    ),
                  )
                : statusRequest == StatusRequest.serverException
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(AppImage.error404,
                                repeat: true, reverse: true, height: 300),
                            Text(
                              "يوجد عطل بالخادم و جاري إصلاح العطل",
                              style: TextStyle(
                                  color: isDark
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : const Color.fromARGB(255, 0, 0, 0)),
                            )
                          ],
                        ),
                      )
                    : statusRequest == StatusRequest.failure
                        ? Center(
                            child: Lottie.asset(AppImage.empty,
                                repeat: true, reverse: true, height: 300),
                          )
                        : widget;
  }
}
