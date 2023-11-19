// ignore_for_file: file_names, must_be_immutable, library_prefixes

import 'package:flutter/material.dart';
import 'package:Tasawe7/services/color.dart' as AppColor;


class HomePageCard1 extends StatelessWidget {




      Color color;
      // IconData icon;
      String title;
      BuildContext context;
      Function () route;

HomePageCard1({Key? key, 

  required this.color,
  required this.route,
  required this.context,
  required this.title,
  // required this.icon
}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(
        top:  _w / 14,
        bottom: _w / 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Container(
          //  padding: EdgeInsets.all(15),
          height: _w / 1.2,
          width: _w / 2.4,
          decoration: BoxDecoration(
           gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                         ? AppColor.ColorConB
                         : AppColor.ColorConW, ),
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
      
        color: Color.fromARGB(0, 64, 233, 255),
        child: InkWell(
        
        borderRadius: const BorderRadius.all(
            Radius.circular(25),),
        highlightColor: const Color.fromARGB(255, 36, 156, 254),
        splashColor: const Color.fromARGB(255, 36, 156, 254),
        onTap: 
        route, 
         child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(),
              // Container(
              //   height: _w / 8,
              //   width: _w / 8,
              //   decoration: BoxDecoration(
              //     color: color.withOpacity(.1),
              //     shape: BoxShape.circle,
              //   ),
              //   child: Icon(
              //     icon,
              //     color: color.withOpacity(.6),
              //   ),
              // ),
              Text(
                title,
                maxLines: 4,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: isDark
                         ? AppColor.ColorTextB
                         : AppColor.ColorText,
                  fontWeight: FontWeight.w700,
                  fontSize: 17
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(),
            ],
          ),
        ),
        ),
        )] )
    );
  }
}























class HomePageCard2 extends StatelessWidget {



      var icon =Icons.phone;
      Color color;
      // IconData icon;
      String title;
      BuildContext context;
      Function () route;
                      
      // Widget child ; 

HomePageCard2({Key? key, 
  required this.icon,
  required this.color,
  required this.route,
  required this.context,
  required this.title,
  // required this.child,
  // required this.icon
}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(
        top:  _w / 14,
        bottom: _w / 60,
        left:  _w / 40,
        right:  _w / 40,),
      
        
          child: Container(
            //  padding: EdgeInsets.all(15),
            height: _w / 1.2,
            width: _w / 2.4,
            decoration: BoxDecoration(
             gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isDark
                           ? AppColor.ColorConB
                           : AppColor.ColorConW, ),
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
      
        color: Color.fromARGB(0, 64, 233, 255),
        child: InkWell(
          
            borderRadius: const BorderRadius.all(
                Radius.circular(25),),
          highlightColor: Color.fromARGB(255, 36, 156, 254),
          splashColor: Color.fromARGB(255, 36, 149, 254),
          onTap: 
            route, 
             child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(),
                    // Container(
                    //   height: _w / 8,
                    //   width: _w / 8,
                    //   decoration: BoxDecoration(
                    //     color: color.withOpacity(.1),
                    //     shape: BoxShape.circle,
                    //   ),
                    //   child: Icon(
                    //     icon,
                    //     color: color.withOpacity(.6),
                    //   ),
                    // ),
                    Column(
                      children: [
                        Container(child:Icon(icon,size: 40,color: isDark?const Color.fromARGB(255, 255, 255, 255):Colors.blueGrey,) ,),
                        
                        Text(
                          title,
                          maxLines: 4,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: isDark
                                   ? AppColor.ColorTextB
                                   : AppColor.ColorText,
                            fontWeight: FontWeight.w700,
                            fontSize: 17
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}




class ExpandCard extends StatefulWidget {
 
      var icon =Icons.phone;
      Color color;
      String title ;
      BuildContext context;
      Function () route;                 
      String Details ;

ExpandCard({Key? key, 
  required this.icon,
  required this.color,
  required this.route,
  required this.context,
  required this.title,
  required this.Details,

}) : super(key: key);
  
 
  @override
  _ExpandCardState createState() => _ExpandCardState();
}

class _ExpandCardState extends State<ExpandCard> {



  String TapToExpandIt = 'Tap to Expand it';
  String Sentence = 'Widgets that have global keys reparent their subtrees when'
      ' they are moved from one location in the tree to another location in the'
      ' tree. In order to reparent its subtree, a widget must arrive at its new'
      ' location in the tree in the same animation frame in which it was removed'
      ' from its old location the tree.'
      ' Widgets that have global keys reparent their subtrees when they are moved'
      ' from one location in the tree to another location in the tree. In order'
      ' to reparent its subtree, a widget must arrive at its new location in the'
      ' tree in the same animation frame in which it was removed from its old'
      ' location the tree.';
  bool isExpanded = true;
  bool isExpanded2 = true;


  @override
  Widget build(BuildContext context) {
    return InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: AnimatedContainer(
          margin: EdgeInsets.symmetric(
            horizontal: isExpanded ? 25 : 0,
            vertical: 20,
          ),
          padding: EdgeInsets.all(20),
          height: isExpanded ? 70 : 330,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1200),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff6F12E8).withOpacity(0.5),
                blurRadius: 20,
                offset: Offset(5, 10),
              ),
            ],
            color: Color(0xff6F12E8),
            borderRadius: BorderRadius.all(
              Radius.circular(isExpanded ? 20 : 0),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "title",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: Colors.white,
                    size: 27,
                  ),
                ],
              ),
              isExpanded ? SizedBox() : SizedBox(height: 20),
              AnimatedCrossFade(
                firstChild: Text(
                  '',
                  style: TextStyle(
                    fontSize: 0,
                  ),
                ),
                secondChild: Text(
                  Sentence,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.7,
                  ),
                ),
                crossFadeState: isExpanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 1200),
                reverseDuration: Duration.zero,
                sizeCurve: Curves.fastLinearToSlowEaseIn,
              ),
            ],
          ),
        )
    );
  }
}











class HomePageCard3 extends StatelessWidget {

      String title;
      String subtitle;
      String image;
      Widget route;


HomePageCard3({Key? key, 
  required this.image,
  required this.route,
  required this.subtitle,
  required this.title,
}) : super(key: key);



  @override
  Widget build(BuildContext context) {
     double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(_w / 20, 0, _w / 20, _w / 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        
       InkWell(
         highlightColor: Colors.transparent,
         splashColor: Colors.transparent,
        onTap:    () {  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return route;
                },
              ),
        );},

         child: Container(
           width: _w / 2.6,
           height: _w / 1.8,
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(20),
             boxShadow: [
               BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 50),
             ],
           ),
           child: Column(
             children: [
               Container(
                 width: _w / 2.36,
                 height: _w / 3,
                 decoration: const BoxDecoration(
                   color: Color(0xff5C71F3),
                   borderRadius: BorderRadius.vertical(
                     top: Radius.circular(20),
                   ),
                 ),
                 alignment: Alignment.center,
                 child: const Text(
                   'Add image here',
                   textScaleFactor: 1.2,
                   style: TextStyle(color: Colors.white),
                 ),
               ),
               // Image.asset(
               //   image,
               //   fit: BoxFit.cover,
               //   width: _w / 2.36,
               //   height: _w / 2.6),
               Container(
                 height: _w / 9,
                 width: _w / 2.36,
                 padding: EdgeInsets.symmetric(horizontal: _w / 25),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       title,
                       textScaleFactor: 1.4,
                       maxLines: 1,
                       softWrap: true,
                       overflow: TextOverflow.ellipsis,
                       style: TextStyle(
                         color: Colors.black.withOpacity(.8),
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                     Text(
                       subtitle,
                       textScaleFactor: 1,
                       maxLines: 1,
                       softWrap: true,
                       overflow: TextOverflow.ellipsis,
                       style: TextStyle(
                         fontWeight: FontWeight.w600,
                         color: Colors.black.withOpacity(.7),
                       ),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
       ) 
  ])
      );
  }
}








class CurrencyCard extends StatelessWidget {



      var icon =Icons.phone;
      Color color;
      // String title;
      // BuildContext context;
                      
      Widget child ; 

CurrencyCard({Key? key, 
  required this.color,
  // required this.context,
  // required this.title,
  required this.child,
  // required this.icon
}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(
        top:  _w / 14,
        bottom: _w / 60,
        left:  _w / 20,
        right:  _w / 20,),
      
        
          child: Container(
            //  padding: EdgeInsets.all(15),
            height: _w / 1.2,
            width: _w / 2.4,
            decoration: BoxDecoration(
             gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isDark
                           ? AppColor.ColorConB
                           : AppColor.ColorConW, ),
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
      
        color: Color.fromARGB(0, 64, 233, 255),
        child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               const SizedBox(),
               Column(
                 children: [
                   Container(child:child) ,
                   
                  //  Text(
                  //    title,
                  //    maxLines: 4,
                  //    softWrap: true,
                  //    overflow: TextOverflow.ellipsis,
                  //    style: TextStyle(
                  //      color: isDark
                  //             ? AppColor.ColorTextB
                  //             : AppColor.ColorText,
                  //      fontWeight: FontWeight.w700,
                  //      fontSize: 17
                  //    ),
                  //    textAlign: TextAlign.center,
                  //  ),
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
