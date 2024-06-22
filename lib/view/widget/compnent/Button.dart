// ignore_for_file: must_be_immutable, file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:Tasawe7/controller/core/constants/color.dart';

class Button extends StatefulWidget {
  String title;
  // double hight;
  // double width;
  double verticalPadding;
  double horizontalPadding;
  double realHeight;
  double isTappedHeight;
  double realWidth;
  double isTappedWidth;
  late Function() onTap;
  Button({
    Key? key,
    required this.title,
    // required this.hight,
    // required this.width,
    required this.verticalPadding,
    required this.horizontalPadding,
    required this.realHeight,
    required this.isTappedHeight,
    required this.realWidth,
    required this.isTappedWidth,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isTapped = false;
  @override
  void initState() {
    super.initState();
    // setState(() {
    //   isTapped = true;
    // });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        // width: widget.width,
        // height: widget.hight,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(
            vertical: widget.verticalPadding,
            horizontal: widget.horizontalPadding),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastLinearToSlowEaseIn,
            height: isTapped ? widget.isTappedHeight : widget.realHeight,
            width: isTapped ? widget.isTappedWidth : widget.realWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: isDark ? Alignment.topCenter : Alignment.topCenter,
                end: isDark ? Alignment.bottomCenter : Alignment.bottomCenter,
                colors: isDark
                    ? [const Color(0xFF59CAEF), const Color(0xff2F3D75)]
                    : [const Color(0xFF59CAEF), const Color(0xff2F3D75)],
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(200),
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? AppColor.ColorResponsiveButtonShadowB
                      : AppColor.ColorResponsiveButtonShadow,
                  blurRadius: 10,
                  // offset: Offset(3, 7),
                ),
              ],
            ),
            child: Material(
              color: const Color.fromARGB(0, 64, 233, 255),
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                highlightColor: const Color.fromARGB(255, 36, 156, 254),
                splashColor: const Color.fromARGB(255, 36, 149, 254),
                onHighlightChanged: (value) {
                  setState(() {
                    isTapped = value;
                  });
                },
                onTap: widget.onTap,
                child: Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: isDark
                          ? AppColor.ColorResponsiveButtonTxTB
                          : AppColor.ColorResponsiveButtonTxT,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Button2 extends StatefulWidget {
  // String title;
  // double hight;
  // double width;
  double verticalPadding;
  double horizontalPadding;
  double realHeight;
  double isTappedHeight;
  double realWidth;
  double isTappedWidth;
  Color color1;
  Color color2;
  var widget1;
  late Function() onTap;
  Button2({
    Key? key,
    // required this.title,
    // required this.hight,
    // required this.width,
    required this.verticalPadding,
    required this.horizontalPadding,
    required this.realHeight,
    required this.isTappedHeight,
    required this.realWidth,
    required this.isTappedWidth,
    required this.color1,
    required this.color2,
    this.widget1,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Button2> createState() => _Button2State();
}

class _Button2State extends State<Button2> {
  bool isTapped = false;
  @override
  void initState() {
    super.initState();
    // setState(() {
    //   isTapped = true;
    // });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn,
          height: isTapped ? widget.isTappedHeight : widget.realHeight,
          width: isTapped ? widget.isTappedWidth : widget.realWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: isDark ? Alignment.topCenter : Alignment.topCenter,
              end: isDark ? Alignment.bottomCenter : Alignment.bottomCenter,
              colors: isDark
                  ? [widget.color1, widget.color2]
                  : [widget.color1, widget.color2],
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? const Color.fromARGB(255, 254, 36, 36)
                    : const Color.fromARGB(255, 254, 36, 36),
                blurRadius: 10,
                // offset: Offset(3, 7),
              ),
            ],
          ),
          child: Material(
            color: const Color.fromARGB(0, 64, 233, 255),
            child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
                highlightColor: const Color.fromARGB(255, 61, 19, 19),
                splashColor: const Color.fromARGB(255, 78, 28, 24),
                onHighlightChanged: (value) {
                  setState(() {
                    isTapped = value;
                  });
                },
                onTap: widget.onTap,
                child: Center(
                  child: widget.widget1,
                )),
          ),
        ),
      ),
    );
  }
}

class Button3 extends StatefulWidget {
  double verticalPadding;
  double horizontalPadding;
  double realHeight;
  double isTappedHeight;
  double realWidth;
  double isTappedWidth;
  Color color1;
  Color color2;
  Color highlightColor;
  Color splashColor;
  Color shadow;
  var widget1;
  late Function() onTap;
  Button3({
    Key? key,
    required this.verticalPadding,
    required this.horizontalPadding,
    required this.realHeight,
    required this.isTappedHeight,
    required this.realWidth,
    required this.isTappedWidth,
    required this.color1,
    required this.color2,
    required this.shadow,
    this.widget1,
    required this.highlightColor,
    required this.splashColor,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Button3> createState() => _Button3State();
}

class _Button3State extends State<Button3> {
  bool isTapped = false;
  @override
  void initState() {
    super.initState();
    // setState(() {
    //   isTapped = true;
    // });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn,
          height: isTapped ? widget.isTappedHeight : widget.realHeight,
          width: isTapped ? widget.isTappedWidth : widget.realWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: isDark ? Alignment.topCenter : Alignment.topCenter,
              end: isDark ? Alignment.bottomCenter : Alignment.bottomCenter,
              colors: isDark
                  ? [widget.color1, widget.color2]
                  : [widget.color1, widget.color2],
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: widget.shadow,
                blurRadius: 10,
                // offset: Offset(3, 7),
              ),
            ],
          ),
          child: Material(
            color: const Color.fromARGB(0, 64, 233, 255),
            child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                highlightColor: widget.highlightColor,
                splashColor: widget.splashColor,
                onHighlightChanged: (value) {
                  setState(() {
                    isTapped = value;
                  });
                },
                onTap: widget.onTap,
                child: Center(
                  child: widget.widget1,
                )),
          ),
        ),
      ),
    );
  }
}
