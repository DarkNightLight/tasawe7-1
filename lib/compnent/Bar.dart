// ignore_for_file: file_names, must_be_immutable, library_prefixes, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:Tasawe7/compnent/Painter.dart';
import 'package:Tasawe7/services/color.dart' as AppColor;
import 'package:Tasawe7/view/suggestions.dart';


class Bar extends StatelessWidget {
  //  Bar({Key? key}) : super(key: key);
   var title = "";
   var drawer = const Drawer();
    late Widget child;
   var acction = <Widget>[
    IconButton(
      icon: const Icon(Icons.qr_code_scanner_outlined),
      color: Colors.white,
      iconSize: 30,
      onPressed: () {},
    )
  ];
 

 Bar({Key? key, 
     required  this.title,

    //  required  this.drawer,

     required  this.acction,

     required  this.child,
 }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.transparent
));



    final double screenHeigh = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return  Scaffold(
          // drawer: drawer,
          primary: false,
        
          backgroundColor: isDark
          ? AppColor.ColorAppBarBackGraoundB
          : AppColor.ColorAppBarBackGraound,
          appBar: AppBar(
         
         
          actions: acction,
            
            //  [IconButton(onPressed: (() {
            //   showSearch(context: context, delegate: Search(list: listsearch)); 
            // }), icon:Icon(Icons.search_rounded))],

          primary: false,
          title: Text(title,
          style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDark
          ? AppColor.ColorTextB
          : AppColor.ColorText,),
          ),
          centerTitle: true,
          toolbarHeight: screenHeigh /9,
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          elevation: 0,
          shape: const RoundedRectangleBorder(
           side: BorderSide(
            strokeAlign: 0.5,
            color:   Color.fromARGB(0, 13, 17, 36),
            width: 20,
            style: BorderStyle.solid),

          borderRadius:

          BorderRadius.only(
            topLeft:  Radius.circular(0),
            bottomRight: Radius.circular(100),
            topRight:  Radius.circular(0),
            bottomLeft: Radius.circular(100),)),
          flexibleSpace: 
                  Container(
            
            // padding: EdgeInsets.only(top: 15),
                     decoration: BoxDecoration(  borderRadius:
          BorderRadius.only(
            topLeft:  Radius.circular(0),
            bottomRight: Radius.circular(100),
            topRight:  Radius.circular(0),
            bottomLeft: Radius.circular(100),), gradient: LinearGradient(
           begin: isDark ?
           Alignment.centerLeft:Alignment.topCenter,
           end:isDark ?
           Alignment.centerRight:Alignment.bottomCenter,
           colors: isDark
           ?   AppColor.ColorAppBarB
           :   AppColor.ColorAppBar
           ),
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
    // drawer: 
    //      Drawer(backgroundColor: const Color.fromARGB(0, 131, 194, 194),
    //      shape: 
    //          const RoundedRectangleBorder(
    //           borderRadius: BorderRadius.only(
    //               topRight: Radius.circular(20),
    //               bottomRight: Radius.circular(20))),
         
    //     child: ListView(
    //       padding: const EdgeInsets.all(0),
    //       children: [
    //         const DrawerHeader(
    //           decoration: BoxDecoration(
    //             color: Color.fromARGB(76, 36, 156, 254),
    //           ), //BoxDecoration
    //           child: UserAccountsDrawerHeader(
    //             decoration: BoxDecoration(color: Color.fromARGB(0, 85, 156, 184),),
               
    //             accountName: Text(
    //               "Nader Mamdouh",
    //               style: TextStyle(fontSize: 18),
    //             ),
    //             accountEmail: Text("NaderMamdouh@gmail.com"),
    //             currentAccountPictureSize: Size.square(50),
    //             currentAccountPicture: CircleAvatar(
    //               backgroundColor: Color.fromARGB(0, 212, 221, 209),
    //               child: Text(
    //                 "N",
    //                 style: TextStyle(fontSize: 30.0, color: Colors.white),
    //               ), //Text
    //             ), //circleAvatar
    //           ), //UserAccountDrawerHeader
    //         ), //DrawerHeader
    //         ListTile(
    //           leading: const Icon(Icons.person),
    //           title: const Text(' My Profile '),
    //           onTap: () {
    //             Navigator.pop(context);
    //           },
    //         ),
    //         ListTile(
    //           leading: const Icon(Icons.book),
    //           title: const Text(' My Course '),
    //           onTap: () {
    //             Navigator.pop(context);
    //           },
    //         ),
            
    //         ListTile(
    //           leading: const Icon(Icons.video_label),
    //           title: const Text(' Saved Videos '),
    //           onTap: () {
    //             Navigator.pop(context);
    //           },
    //         ),
    //         ListTile(
    //           leading: const Icon(Icons.edit),
    //           title: const Text(' Edit Profile '),
    //           onTap: () {
    //             Navigator.pop(context);
    //           },
    //         ),
    //         ListTile(
    //           leading: const Icon(Icons.logout),
    //           title: const Text('LogOut'),
    //           onTap: () {
    //             Navigator.pop(context);
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
      floatingActionButton:FloatingActionButton(
          backgroundColor: isDark?AppColor.ColorAppBarBackGraoundB :AppColor.ColorAppBarBackGraound,
          onPressed: () {
           Get.to(Suggestions());
         },
         child: Icon(CupertinoIcons.chat_bubble_fill,
         color: isDark?Color.fromARGB(255, 103, 202, 252):Colors.blueGrey,
         ),) ,

          body:Stack(
        children: [
  

  
    // GetBuilder <HomeController>(
    // init: HomeController(), 
    // builder: ((controller) => 
    
    
    //  GridView(
    //  physics:  BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
     
      
    //         crossAxisSpacing: 1, crossAxisCount: 2),
      
      
        Container(
           decoration: BoxDecoration(
           gradient: LinearGradient(
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
           colors: isDark
           ? AppColor.ColorBackGroundB
           : AppColor.ColorBackGround,
           )),
           
        child: child 
        ),
       
       
          CustomPaint(
            painter: isDark? Painter2 ():  Painter1(),
            child: Container(
            height: 0),), ])
        );
  }
}










class Bar2 extends StatelessWidget {
  var title = "";
   var drawer = const Drawer();
    late Widget child;
 

 Bar2({Key? key, 
     required  this.title,
    //  required  this.drawer,

     required  this.child,
 });
  @override
  Widget build(BuildContext context) {
    final double screenHeigh = MediaQuery.of(context).size.height;
 bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
          // drawer: drawer,
          primary: false,
        
          backgroundColor: isDark
          ? AppColor.ColorAppBarBackGraoundB
          : AppColor.ColorAppBarBackGraound,
          appBar: AppBar(
         
          // actions: acction,
            
            //  [IconButton(onPressed: (() {
            //   showSearch(context: context, delegate: Search(list: listsearch)); 
            // }), icon:Icon(Icons.search_rounded))],

          primary: false,
          title: Text(title,
          style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDark
          ? AppColor.ColorTextB
          : AppColor.ColorText,),
          ),
          centerTitle: true,
          toolbarHeight: screenHeigh /9,
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          elevation: 0,
          // shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
          //  side: BorderSide(
          //   strokeAlign: 0.5,
          //   // color:    Color.fromARGB(255, 236, 236, 254),
          //   width: 20,
          //   style: BorderStyle.solid),

          borderRadius:

          BorderRadius.only(
            topLeft:  Radius.circular(0),
            bottomRight: Radius.circular(100),
            topRight:  Radius.circular(0),
            bottomLeft: Radius.circular(100),)),
          flexibleSpace: 
           Container(
            
            // padding: EdgeInsets.only(top: 15),
                     decoration: BoxDecoration(  borderRadius:
          BorderRadius.only(
            topLeft:  Radius.circular(0),
            bottomRight: Radius.circular(100),
            topRight:  Radius.circular(0),
            bottomLeft: Radius.circular(100),), gradient: LinearGradient(
           begin: isDark ?
           Alignment.centerLeft:Alignment.topCenter,
           end:isDark ?
           Alignment.centerRight:Alignment.bottomCenter,
           colors: isDark
           ?   AppColor.ColorAppBarB
           :   AppColor.ColorAppBar
           ),
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
    // drawer: 
    //      Drawer(backgroundColor: const Color.fromARGB(0, 131, 194, 194),
    //      shape: 
    //          const RoundedRectangleBorder(
    //           borderRadius: BorderRadius.only(
    //               topRight: Radius.circular(20),
    //               bottomRight: Radius.circular(20))),
         
    //     child: ListView(
    //       padding: const EdgeInsets.all(0),
    //       children: [
    //         const DrawerHeader(
    //           decoration: BoxDecoration(
    //             color: Color.fromARGB(76, 36, 156, 254),
    //           ), //BoxDecoration
    //           child: UserAccountsDrawerHeader(
    //             decoration: BoxDecoration(color: Color.fromARGB(0, 85, 156, 184),),
               
    //             accountName: Text(
    //               "Nader Mamdouh",
    //               style: TextStyle(fontSize: 18),
    //             ),
    //             accountEmail: Text("NaderMamdouh@gmail.com"),
    //             currentAccountPictureSize: Size.square(50),
    //             currentAccountPicture: CircleAvatar(
    //               backgroundColor: Color.fromARGB(0, 212, 221, 209),
    //               child: Text(
    //                 "N",
    //                 style: TextStyle(fontSize: 30.0, color: Colors.white),
    //               ), //Text
    //             ), //circleAvatar
    //           ), //UserAccountDrawerHeader
    //         ), //DrawerHeader
    //         ListTile(
    //           leading: const Icon(Icons.person),
    //           title: const Text(' My Profile '),
    //           onTap: () {
    //             Navigator.pop(context);
    //           },
    //         ),
    //         ListTile(
    //           leading: const Icon(Icons.book),
    //           title: const Text(' My Course '),
    //           onTap: () {
    //             Navigator.pop(context);
    //           },
    //         ),
            
    //         ListTile(
    //           leading: const Icon(Icons.video_label),
    //           title: const Text(' Saved Videos '),
    //           onTap: () {
    //             Navigator.pop(context);
    //           },
    //         ),
    //         ListTile(
    //           leading: const Icon(Icons.edit),
    //           title: const Text(' Edit Profile '),
    //           onTap: () {
    //             Navigator.pop(context);
    //           },
    //         ),
    //         ListTile(
    //           leading: const Icon(Icons.logout),
    //           title: const Text('LogOut'),
    //           onTap: () {
    //             Navigator.pop(context);
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
       floatingActionButton:FloatingActionButton(
          backgroundColor: isDark?AppColor.ColorAppBarBackGraoundB :AppColor.ColorAppBarBackGraound,
          onPressed: () {
           Get.to(Suggestions());
         },
         child: Icon(CupertinoIcons.chat_bubble_fill,
         color: isDark?Color.fromARGB(255, 103, 202, 252):Colors.blueGrey,
         ),) ,
         extendBodyBehindAppBar: true,
          body:Stack(
        children: [
  

  
    // GetBuilder <HomeController>(
    // init: HomeController(), 
    // builder: ((controller) => 
    
    
    //  GridView(
    //  physics:  BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
     
      
    //         crossAxisSpacing: 1, crossAxisCount: 2),
      
      
        Container(
           decoration: BoxDecoration(
           gradient: LinearGradient(
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
           colors: isDark
           ? AppColor.ColorBackGroundB
           : AppColor.ColorBackGround,
           )),
           
        child: child 
        ),
       
      
          CustomPaint(
            painter: isDark? Painter2 ():  Painter1(),
            child: Container(
            height: 0),), ])
        );
  }
}






class Bar3 extends StatelessWidget {
  var title = "";
   var drawer = const Drawer();
    late Widget child;
 

 Bar3({Key? key, 
     required  this.title,

    //  required  this.drawer,

     required  this.child,
 });
  @override
  Widget build(BuildContext context) {
    final double screenHeigh = MediaQuery.of(context).size.height;
 bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
          // drawer: drawer,
          primary: false,
        
          backgroundColor: isDark
          ? AppColor.ColorAppBarBackGraoundB
          : AppColor.ColorAppBarBackGraound,
          appBar: AppBar(
         
         
          // actions: acction,
            
            //  [IconButton(onPressed: (() {
            //   showSearch(context: context, delegate: Search(list: listsearch)); 
            // }), icon:Icon(Icons.search_rounded))],
          leading: IconButton(
            onPressed:    (){
                       Get.back();
                       },  
          icon: Icon (Icons.arrow_back_ios_new , 
          color: isDark
          ? AppColor.ColorTextB
          : AppColor.ColorText,)),
          primary: false,
          title: Text(title,
          style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDark
          ? AppColor.ColorTextB
          : AppColor.ColorText,),
          ),
          centerTitle: true,
          toolbarHeight: screenHeigh /9,
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          elevation: 0,
          shape: const RoundedRectangleBorder(
          //  side: BorderSide(
          //   strokeAlign: 0.5,
          //   // color:    Color.fromARGB(255, 236, 236, 254),
          //   width: 20,
          //   style: BorderStyle.solid),

          borderRadius:

          BorderRadius.only(
            topLeft:  Radius.circular(0),
            bottomRight: Radius.circular(100),
            topRight:  Radius.circular(0),
            bottomLeft: Radius.circular(100),)),
          flexibleSpace: 
           Container(
            
            // padding: EdgeInsets.only(top: 15),
                     decoration: BoxDecoration(  borderRadius:
          BorderRadius.only(
            topLeft:  Radius.circular(0),
            bottomRight: Radius.circular(100),
            topRight:  Radius.circular(0),
            bottomLeft: Radius.circular(100),), gradient: LinearGradient(
           begin: isDark ?
           Alignment.centerLeft:Alignment.topCenter,
           end:isDark ?
           Alignment.centerRight:Alignment.bottomCenter,
           colors: isDark
           ?   AppColor.ColorAppBarB
           :   AppColor.ColorAppBar
           ),
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

          body:Stack(
        children: [
  

  

      
        Container(
           decoration: BoxDecoration(
           gradient: LinearGradient(
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
           colors: isDark
           ? AppColor.ColorBackGroundB
           : AppColor.ColorBackGround,
           )),
           
        child: child 
        ),
       
      
          CustomPaint(
            painter: isDark? Painter2 ():  Painter1(),
            child: Container(
            height: 0),), ])
        );
  }
}









