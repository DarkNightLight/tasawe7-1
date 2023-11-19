// ignore_for_file: prefer_const_constructors, unused_local_variable, library_prefixes, unused_import, use_key_in_widget_constructors, file_names

import 'package:Tasawe7/currency/Currency.dart';
import 'package:Tasawe7/view/Emergency.dart';
import 'package:Tasawe7/view/GoldPrice.dart';
import 'package:Tasawe7/view/MasrScreen.dart';
import 'package:Tasawe7/view/SplashScreen.dart';
import 'package:Tasawe7/view/TSN.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:Tasawe7/compnent/Bar.dart';
import 'package:Tasawe7/services/color.dart' as AppColor;
import 'package:http/http.dart' as http;
import 'package:Tasawe7/view/Inquiry.dart';
import '../compnent/HomePageCard.dart';





class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.transparent
));


    final double screenHeigh = MediaQuery.of(context).size.height; 
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark; 
    return Bar2(
      title: "Tasawe7", 
      child:             
       Directionality(
        textDirection: TextDirection.rtl,
         child: GridView(
          
               physics:  BouncingScrollPhysics(
               parent: AlwaysScrollableScrollPhysics()),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisSpacing: 1, crossAxisCount: 2),
               children: <Widget>[
               
                    HomePageCard2(
                     icon: Icons.handshake_outlined ,
                     color: isDark
                    ? AppColor.ColorTextB
                    : AppColor.ColorText,
                     context: context,
                     route: (){ Get.to(Inquiry());},
                    //  icon: Icons.wallet_giftcard,
                     title: "ارشادات خدمات المواطنين"),
                                
                                
                    HomePageCard2(
                     icon: CupertinoIcons.device_laptop ,
                     color: isDark
                    ? AppColor.ColorTextB
                    : AppColor.ColorText,
                     context: context,
                     route: (){
                       Get.to(MasrScreen());
                       },
                    //  icon: Icons.wallet_giftcard,
                     title: "منصة مصر الرقمية"),
                               
                                
                    HomePageCard2(
                     icon: CupertinoIcons.hammer_fill  ,
                     color: isDark
                    ? AppColor.ColorTextB
                    : AppColor.ColorText,
                     context: context,
                     route: (){ 
                      Get.to(TSN());
                      },
                    //  icon: Icons.wallet_giftcard,
                     title: "ارقام الاعطال بالمحافظات"),
                                        
                                        
                    HomePageCard2(
                     icon: CupertinoIcons.phone  ,
                     color: isDark
                    ? AppColor.ColorTextB
                    : AppColor.ColorText,
                     context: context,
                     route: (){
                       Get.to(Emergency());
                       },
                    //  icon: Icons.wallet_giftcard,
                     title: "ارقام الطوارئ"),


                    HomePageCard2(
                     icon: CupertinoIcons.money_dollar_circle  ,
                     color: isDark
                    ? AppColor.ColorTextB
                    : AppColor.ColorText,
                     context: context,
                     route: (){ 
                       Get.to(CurrencyPage());
                      },
                    //  icon: Icons.wallet_giftcard,
                     title: " سعر العملة "),
                                        
                                        
                    HomePageCard2(
                     icon: CupertinoIcons.bitcoin_circle  ,
                     color: isDark
                    ? AppColor.ColorTextB
                    : AppColor.ColorText,
                     context: context,
                     route: (){
                      //  Get.to(GoldPrice());
                       },
                    //  icon: Icons.wallet_giftcard,
                     title: " اسعار الذهب "),
                 
                 
                 
                    // HomePageCard2(
                    //  icon: CupertinoIcons.phone ,
                    //  color: isDark
                    // ? AppColor.ColorTextB
                    // : AppColor.ColorText,
                    //  context: context,
                    //  route: (){
                    //   setState(() {
                    //      Get.to(SplashScreen());
                    //   });
                      
                    //    },
                    // //  icon: Icons.wallet_giftcard,
                    //  title: "ارقام الطوارئ"),

           ],
         ),
       ),
               
               
               );
  }
}