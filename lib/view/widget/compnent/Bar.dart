// ignore_for_file: file_names, must_be_immutable, library_prefixes, prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:Tasawe7/controller/core/constants/color.dart';
import 'package:Tasawe7/view/screen/suggestions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bar extends StatefulWidget {
  var title = "";
  late Widget child;
  var action;

  Bar({
    Key? key,
    required this.title,
    required this.action,
    required this.child,
  }) : super(key: key);

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  var drawer = const Drawer();

  var user = 0;
  var loading = 0;
  var name;
  var supports;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    name = preferences.getString("name");
    supports = preferences.getString("supports");
  }

  void navigate() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var email = preferences.getString("email");
      if (email != null && email != "") {
        setState(() {
          loading = 1;
        });
      } else {
        setState(() {
          loading = 2;
        });
      }
    } catch (ex) {
      setState(() {
        loading = 2;
      });
    }

    if (name != null && name != "") {
      setState(() {
        user = 1;
      });
    }
  }

  @override
  void initState() {
    user = 0;
    loading = 0;
    navigate();
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    final double screenHeigh = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          // primary: false,
          extendBodyBehindAppBar: true,
          backgroundColor: isDark
              ? AppColor.ColorAppBarBackGraoundB
              : AppColor.ColorAppBarBackGraound,
          appBar: AppBar(
            leading: widget.action,
            actions: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
                  )),
            ],
            primary: false,
            title: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.visible,
                color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
              ),
            ),
            centerTitle: true,
            toolbarHeight: screenHeigh / 7,
            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomRight: Radius.circular(100),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(100),
            )),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  bottomRight: Radius.circular(100),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(100),
                ),
                gradient: LinearGradient(
                    begin: isDark ? Alignment.centerLeft : Alignment.topCenter,
                    end:
                        isDark ? Alignment.centerRight : Alignment.bottomCenter,
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
            ),
          ),
          floatingActionButton: loading == 1
              ? Container(
                  padding: EdgeInsets.all(8),
                  // margin: EdgeInsets.all(5),
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
                      Radius.circular(200),
                    ),
                  ),
                  child: Material(
                    color: Color.fromARGB(0, 64, 233, 255),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(200),
                      ),
                      highlightColor: Color.fromARGB(255, 36, 156, 254),
                      splashColor: Color.fromARGB(255, 36, 149, 254),
                      onTap: () {
                        Get.to(() => Suggestions());
                      },
                      child: Icon(
                        CupertinoIcons.chat_bubble_fill,
                        size: 40,
                        color: isDark
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : Color.fromARGB(181, 240, 240, 240),
                      ),
                    ),
                  ),
                )
              : Text(""),
          body: Directionality(
            textDirection: TextDirection.ltr,
            child: Stack(children: [
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: isDark
                        ? AppColor.ColorBackGroundB
                        : AppColor.ColorBackGround,
                  )),
                  child: widget.child),
            ]),
          )),
    );
  }
}

class Bar3 extends StatelessWidget {
  var title = "";
  var drawer = const Drawer();
  late Widget child;

  Bar3({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenHeigh = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: isDark
              ? const Color.fromARGB(0, 43, 49, 79)
              : AppColor.ColorAppBarBackGraound,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
                )),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
              ),
            ),
            centerTitle: true,
            toolbarHeight: screenHeigh / 16,
            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: isDark ? Alignment.centerLeft : Alignment.topCenter,
                    end:
                        isDark ? Alignment.centerRight : Alignment.bottomCenter,
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
            ),
          ),
          body: Stack(children: [
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isDark
                      ? AppColor.ColorBackGroundB
                      : AppColor.ColorBackGround,
                )),
                child: child),
          ])),
    );
  }
}

class Bar4 extends StatelessWidget {
  var title = "";
  late Widget child;

  Bar4({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenHeigh = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          // primary: false,
          extendBodyBehindAppBar: true,
          backgroundColor: isDark
              ? AppColor.ColorAppBarBackGraoundB
              : AppColor.ColorAppBarBackGraound,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
                )),
            primary: false,
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
              ),
            ),
            centerTitle: true,
            toolbarHeight: screenHeigh / 8,
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  bottomRight: Radius.circular(100),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(100),
                ),
                gradient: LinearGradient(
                    begin: isDark ? Alignment.centerLeft : Alignment.topCenter,
                    end:
                        isDark ? Alignment.centerRight : Alignment.bottomCenter,
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
            ),
          ),
          body: Stack(children: [
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isDark
                      ? AppColor.ColorBackGroundB
                      : AppColor.ColorBackGround,
                )),
                child: child),
          ])),
    );
  }
}

class Bar5 extends StatelessWidget {
  var title = "";
  late Widget child;

  Bar5({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenHeigh = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          // primary: false,
          // extendBodyBehindAppBar: true,
          backgroundColor: isDark
              ? AppColor.ColorAppBarBackGraoundB
              : AppColor.ColorAppBarBackGraound,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
                )),
            primary: false,
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
              ),
            ),
            centerTitle: true,
            toolbarHeight: screenHeigh / 8,
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  bottomRight: Radius.circular(100),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(100),
                ),
                gradient: LinearGradient(
                    begin: isDark ? Alignment.centerLeft : Alignment.topCenter,
                    end:
                        isDark ? Alignment.centerRight : Alignment.bottomCenter,
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
            ),
          ),
          body: Stack(children: [
            Container(
                height: screenHeigh,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isDark
                      ? AppColor.ColorBackGroundB
                      : AppColor.ColorBackGround,
                )),
                child: child),
          ])),
    );
  }
}

class Bar6 extends StatelessWidget {
  var title = "";
  late Widget child;

  Bar6({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenHeigh = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: isDark
                ? AppColor.ColorAppBarBackGraoundB
                : AppColor.ColorAppBarBackGraound,
            appBar: AppBar(
              leading: Icon(Icons.abc_outlined, color: Colors.transparent),
              primary: false,
              title: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
                ),
              ),
              centerTitle: true,
              toolbarHeight: screenHeigh / 8,
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    bottomRight: Radius.circular(100),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(100),
                  ),
                  gradient: LinearGradient(
                      begin:
                          isDark ? Alignment.centerLeft : Alignment.topCenter,
                      end: isDark
                          ? Alignment.centerRight
                          : Alignment.bottomCenter,
                      colors: isDark
                          ? AppColor.ColorAppBarB
                          : AppColor.ColorAppBar),
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? AppColor.ColorConShadowB
                          : AppColor.ColorConShadow,
                      blurRadius: 15,
                    ),
                  ],
                ),
              ),
            ),
            body: Stack(children: [
              Container(
                  margin: EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: isDark
                        ? AppColor.ColorBackGroundB
                        : AppColor.ColorBackGround,
                  )),
                  child: child),
            ])),
    );
  }
}
