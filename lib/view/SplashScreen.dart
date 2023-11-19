// import 'package:animated_text_kit/animated_text_kit.dart';

// import 'package:animations/animations.dart';

// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors




import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:Tasawe7/services/color.dart' as AppColors;
import 'package:Tasawe7/view/HomePage.dart';
import 'package:flutter/services.dart';






class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  var loading=0;
  double _fontSize = 2.5;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller1;
  late AnimationController _controller2;
  late Animation<double> animation1;
  
  
//   void navigate () async {
//   try{
//      SharedPreferences preferences = await SharedPreferences.getInstance();
//      var stuID=  preferences.getString("stuID");
//      if(stuID != null && stuID !="")
//        { 
//          setState(() {
//            loading=1;
//          });
//       }
//       else
//         setState(() {
//            loading=2;
//          });     
//     }catch(ex){
//          setState(() {
//            loading=2;
//          });
//     }
  

// }


  @override
  void initState() {
    super.initState();


    _controller2 =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 6620))
          ..repeat();



    loading=0;
    // navigate();
    _controller1=
        AnimationController(vsync: this, duration: const Duration(milliseconds: 2500));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller1, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller1.forward();

    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        _fontSize = 1.25;
      });
    });

    Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(const Duration(milliseconds: 4000), () {
      setState(() {
      Navigator.pushReplacement(context, PageTransition(loading==1? HomePage():HomePage()));
        // Get.off(  loading==1? PageTransition(LoginScreen()):PageTransition(LoginScreen()));
          // Get.off(  PageTransition( LoginScreen():LoginScreen()));
          _controller2.dispose(); 
          });
       
    });
    
  }

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    ));
    final double screenHeigh = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return
          Scaffold(
           backgroundColor: isDark
           ?AppColors.ColorAppBarBackGraoundB
           :AppColors.ColorAppBarBackGraound,
           body: Stack(
            children: [
              Column( 
               children: [
                 Center(
                  child: AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: screenHeigh / _fontSize,),),

                 AnimatedOpacity(
                   duration: const Duration(milliseconds: 1000),
                   opacity: _textOpacity,
                   child: 
                   Container(
                     width: screenWidth/7,
                     height: screenHeigh/7,
                     child: Image.asset("images/NMB.png"))),
                
                ],),
                
                  Center(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.fastLinearToSlowEaseIn,
                      opacity: _containerOpacity,
                      child:         
                       AnimatedContainer(
                        duration: const Duration(milliseconds: 3000),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: screenWidth / _containerSize,
                        width: screenWidth / _containerSize,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),),
                        child:
                         AnimatedContainer(
                          width: screenWidth/3  ,
                          duration: const Duration(milliseconds: 4000),
                          child:  Center(
                            child: AnimatedBuilder(
                              animation: _controller2,
                              builder: (_, child) {
                                return Transform.rotate(
                                  angle: _controller2.value * -15 * math.pi,
                                  child: child,);},
                                  child: Image.asset('images/Logo2.png',),
                  ),
                  ),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}



class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
              
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );


}






              // AnimatedContainer(
              //   duration: Duration(milliseconds: 2000),
              //   curve: Curves.fastLinearToSlowEaseIn,
              //   height: _width / _containerSize,
              //   width: _width / _containerSize,
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(30),
              //   ),
              //   child: Image.asset('images/Logo2.png')
              //   ),



      































// import 'package:flutter/material.dart';

// import 'dart:async';

// import 'package:us/moduls/login/login_screen.dart';

// import 'dart:math' as math;


// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>   
//  with SingleTickerProviderStateMixin {
  
//   late AnimationController _controller;
  
  




//   List<Color> colorList = [
//       Colors.blueGrey,
//       Color.fromARGB(255, 132, 188, 214),
//       Color.fromARGB(255, 206, 200, 200),
//       Color.fromARGB(255, 75, 66, 128),
//   ];
//   List<Alignment> alignmentList = [
//     Alignment.bottomLeft,
//     Alignment.bottomRight,
//     Alignment.topRight,
//     Alignment.topLeft,
//   ];
//   int index = 0;
//   Color bottomColor = Colors.blueGrey;
//   Color topColor = Colors.lightBlue;
//   Alignment begin = Alignment.bottomLeft;
//   Alignment end = Alignment.topRight;


//    Future getColors() async{
//              setState(() {
//               index = index + 1;
//               // animate the color
//               bottomColor = colorList[index % colorList.length];
//               topColor = colorList[(index + 1) % colorList.length];

//               // animate the alignment
//               begin = alignmentList[index % alignmentList.length];
//               end = alignmentList[(index + 2) % alignmentList.length];
//             });
//    }
   






//   @override
//   void initState() {
    


//        getColors();
//        Timer(
//       Duration(microseconds: 0),
//       () {
//         setState(
//           () {
//             bottomColor = Color.fromARGB(255, 75, 66, 128);
//           },
//         );
//       },
//     );

  

//         _controller =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 6620))
//            ..repeat();
//     super.initState();


//     Timer(Duration(milliseconds: 0), () {
//       setState(() {
//         _a = true;

//       });
//     });
//     Timer(Duration(milliseconds: 0), () {
//       setState(() {
//         _b = true;

//       });
//     });
//     Timer(Duration(milliseconds: 0), () {
//       setState(() {
//         _c = true;

//       });
//     });
//     Timer(Duration(milliseconds: 100), () {
//       setState(() {
//         _e = true;

//       });
//     });
//     Timer(Duration(milliseconds: 3400), () {
//       setState(() {
//         _d = true;

//       });
//     });
//     Timer(Duration(milliseconds: 4500), () {
//       setState(() {
//         _controller.dispose();
//         Navigator.of(context).pushReplacement(ThisIsFadeRoute(route: LoginScreen(), page: LoginScreen() ,
//           ),
//         );
//       });
//     });
//   }

//   bool _a = false;
//   bool _b = false;
//   bool _c = false;
//   bool _d = false;
//   bool _e = false;

//   @override
//   void dispose() {
//     super.dispose();
//     // _controller.dispose();

//   }

//   @override
//   Widget build(BuildContext context) {
//     double _h = MediaQuery.of(context).size.height;
//     double _w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 255, 255, 255),
//       body:  

      
//       Container(
//         child: 
        
//         // AnimatedContainer(
//         //                 duration: Duration(milliseconds: 5000),
//         //                 onEnd: () {
//         //                   setState(() { 
//         //                   getColors();
//         //                   });
//         //                 },
//         //                  decoration: BoxDecoration(
//         //                  gradient: LinearGradient(
//         //                  begin: begin, end: end, colors: [bottomColor, topColor])), 
                      

                    
//         Center(
//           child: Column(
//             children: [
//               AnimatedContainer(
//                 duration: Duration(milliseconds: _d ? 900 : 2500),
//                 curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
//                 height: _d
//                     ? 0
//                     : _a
//                         ? _h / 2
//                         : 20,
//                 width: 20, 
//                 // color: Colors.deepPurpleAccent,
//               ),
//               AnimatedContainer(
//                 duration: Duration(
//                     seconds: _d
//                         ? 1
//                         : _c
//                             ? 2
//                             : 0),
//                 curve: Curves.fastLinearToSlowEaseIn,
//                 height: _d
//                     ? _h
//                     : _c
//                         ? 80
//                         : 20,
//                 width: _d
//                     ? _w/3
//                     : _c
//                         ? 200
//                         : 20,
//                 decoration: BoxDecoration(
//                     color: _b ? Color.fromARGB(0, 136, 0, 0) : Colors.transparent,
//                     // shape: _c? BoxShape.rectangle : BoxShape.circle,
//                     borderRadius:
//                         _d ? BorderRadius.only() : BorderRadius.circular(30)),
//                 child: Center(
//                   child: _e
//                       ? 
//                       AnimatedContainer(
                        
//                          duration: Duration(milliseconds: 1940),
//                          child:  Center(
//               child: AnimatedBuilder(
//                 animation: _controller,
//                 builder: (_, child) {
//                   return Transform.rotate(
//                     angle: _controller.value * -15 * math.pi,
//                     child: child,
//                   );
//                 },
//                 child: Image.asset(
//                   'images/Logo2.png',
//                 ),
//               ),
//             ),
//                          )
                     


//                       // AnimatedTextKit(
//                       //     totalRepeatCount: 1,
//                       //     animatedTexts: [
//                       //       FadeAnimatedText(
//                       //         'APP NAME',
//                       //         duration: Duration(milliseconds: 1700),
//                       //         textStyle: TextStyle(
//                       //           fontSize: 30,
//                       //           fontWeight: FontWeight.w700,
//                       //         ),
//                       //       ),
//                       //     ],
//                       //   )



//                       : SizedBox(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ThisIsFadeRoute extends PageRouteBuilder {
//   final Widget page;
//   final Widget route;

//   ThisIsFadeRoute({required this.page, required this.route})
//       : super(
//           pageBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//           ) =>
//               page,
//           transitionsBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//             Widget child,
//           ) =>
//               FadeTransition(
//             opacity: animation,
//             child: route,
//           ),
//         );
// }

// class ThirdPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Go Back'),
//         centerTitle: true,
//         brightness: Brightness.dark,
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
// }

