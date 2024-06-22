// ignore_for_file: file_names

import 'package:Tasawe7/view/widget/compnent/text.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:Tasawe7/view/screen/SplashScreen.dart';
import 'package:lottie/lottie.dart';

import '../../controller/core/constants/appImage.dart';
import '../../controller/core/constants/color.dart';
import '../widget/compnent/Button.dart'; // Or HomePage depending on your flow

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  final box = GetStorage();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark ? AppColor.ColorBackGroundB : AppColor.ColorBackGround,
        )),
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: [
                buildOnboardingPage(AppImage.logoT3, "مرحباً",
                    "اول تطبيق مصري صمم خصيصاً لعدم تسويح المواطنين"),
                buildOnboardingPageLottie(AppImage.welcome2, "سهل الإستخدام",
                    "بيانات موثوقة و يتم تحديثها بشكل دوري مع إمكانية إرسال أرائك و إقتراحاتك لنا"),
                buildOnboardingPageLottie(AppImage.welcome1, "هيا نبدأ", ""),
              ],
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: currentPage != 2
                  ? Button3(
                      verticalPadding: 0,
                      horizontalPadding: 0,
                      realHeight: 50,
                      isTappedHeight: 50,
                      realWidth: 90,
                      isTappedWidth: 70,
                      color1: Colors.white,
                      color2: Colors.white,
                      highlightColor: const Color.fromARGB(255, 36, 149, 254),
                      splashColor: const Color.fromARGB(255, 36, 149, 254),
                      shadow: isDark
                          ? AppColor.ColorResponsiveButtonShadowB
                          : AppColor.ColorResponsiveButtonShadow,
                      widget1: Txt(
                          size: 14,
                          color: isDark ? Colors.black : Colors.black,
                          text: "تخطي"),
                      onTap: (() async {
                        _pageController.jumpToPage(2);
                        // controller.clearUserData();
                      }))
                  : Container(),
            ),
            Positioned(
                bottom: 30,
                right: 20,
                child: Button3(
                    verticalPadding: 0,
                    horizontalPadding: 0,
                    realHeight: 50,
                    isTappedHeight: 50,
                    realWidth: 90,
                    isTappedWidth: 70,
                    color1: const Color(0xFF59CAEF),
                    color2: const Color(0xff2F3D75),
                    highlightColor: const Color.fromARGB(255, 36, 149, 254),
                    splashColor: const Color.fromARGB(255, 36, 149, 254),
                    shadow: isDark
                        ? AppColor.ColorResponsiveButtonShadowB
                        : AppColor.ColorResponsiveButtonShadow,
                    widget1: Txt(
                        size: 14,
                        color: isDark
                            ? AppColor.ColorResponsiveButtonTxTB
                            : AppColor.ColorResponsiveButtonTxT,
                        text: currentPage == 2 ? "إبدأ الأن" : "التالي"),
                    onTap: (() async {
                      if (currentPage == 2) {
                        box.write('isFirstTime', false);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashScreen()),
                        );
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    }))),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 10,
                    width: currentPage == index ? 20 : 10,
                    decoration: BoxDecoration(
                      color: currentPage == index ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnboardingPage(
      String imagePath, String title, String description) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 300, width: 300),
        const SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColor.ColorTextB : AppColor.ColorTextOnBoarding,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color:
                  isDark ? AppColor.ColorTextB : AppColor.ColorTextOnBoarding,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildOnboardingPageLottie(
      String imagePath, String title, String description) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(imagePath, height: 300, width: 300),
        const SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColor.ColorTextB : AppColor.ColorTextOnBoarding,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color:
                  isDark ? AppColor.ColorTextB : AppColor.ColorTextOnBoarding,
            ),
          ),
        ),
      ],
    );
  }
}
