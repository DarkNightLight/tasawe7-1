// ignore_for_file: file_names, must_be_immutable, library_prefixes, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:Tasawe7/controller/core/constants/color.dart';

class HomePageCard1 extends StatelessWidget {
  Color color;
  String title;
  BuildContext context;
  Function() route;

  HomePageCard1({
    Key? key,
    required this.color,
    required this.route,
    required this.context,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
        padding: EdgeInsets.only(top: _w / 14, bottom: _w / 60),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            height: _w / 1.2,
            width: _w / 2.4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: isDark ? AppColor.ColorConB : AppColor.ColorConW,
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? AppColor.ColorConShadowB
                      : AppColor.ColorConShadow,
                  blurRadius: 10,
                ),
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Material(
              color: const Color.fromARGB(0, 64, 233, 255),
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                highlightColor: const Color.fromARGB(255, 36, 156, 254),
                splashColor: const Color.fromARGB(255, 36, 156, 254),
                onTap: route,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(),
                    Text(
                      title,
                      maxLines: 4,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: "ElMessiri",
                          color:
                              isDark ? AppColor.ColorTextB : AppColor.ColorText,
                          fontWeight: FontWeight.w700,
                          fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}

class HomePageCard2 extends StatelessWidget {
  var icon;
  Color color;
  String title;
  BuildContext context;
  Function() route;

  HomePageCard2({
    Key? key,
    required this.icon,
    required this.color,
    required this.route,
    required this.context,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(5),
      height: _w / 1.2,
      width: _w / 2.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark ? AppColor.ColorConB : AppColor.ColorConW,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? AppColor.ColorConShadowB : AppColor.ColorConShadow,
            blurRadius: 10,
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Material(
        color: const Color.fromARGB(0, 64, 233, 255),
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          highlightColor: const Color.fromARGB(255, 36, 156, 254),
          splashColor: const Color.fromARGB(255, 36, 149, 254),
          onTap: route,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5, top: 5),
                    child: icon,
                  ),
                  Text(
                    title,
                    maxLines: 4,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: "ElMessiri",
                        color:
                            isDark ? AppColor.ColorTextB : AppColor.ColorText,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
