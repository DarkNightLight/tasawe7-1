// ignore_for_file: non_constant_identifier_names, library_prefixes, prefer_typing_uninitialized_variables, file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use, avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Tasawe7/controller/core/constants/color.dart';
import 'package:url_launcher/url_launcher.dart';



class EmergencyList extends StatefulWidget {

final em_name;
final em_number;
final route ;
EmergencyList({Key? key,  

this.em_name,
this.em_number, 
this.route,


  }) : super(key: key);


  @override
  State<EmergencyList> createState() => _EmergencyListState();
  
}

class _EmergencyListState extends State<EmergencyList> {
bool isExpanded = false;
  @override
  void initState() {
    super.initState();
    setState(() {
                isExpanded = !isExpanded;
              });
  }
  
Future<void> _makePhoneCall(String phoneNumber) async {
  final String url = 'tel:$phoneNumber';
  try {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    print('Error launching phone call: $e');
  }
}

// savePref(var Inquiry)
  @override
  Widget build(BuildContext context) {
     bool isDark = Theme.of(context).brightness == Brightness.dark;
    return           
     Directionality(textDirection: TextDirection.rtl,
       child: AnimatedContainer(
         margin: EdgeInsets.only(top: 25 , right: 20 , left: 20),
         height: isExpanded ? 90 : 110,
         curve: Curves.fastLinearToSlowEaseIn,
         duration: Duration(milliseconds: 1200),
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
           borderRadius: BorderRadius.all(
             Radius.circular(isExpanded ? 25 : 25),
           ),
         ),
         child: Column(
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                   width: 250,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: RichText( 
                     text: TextSpan(
                     text: widget.em_name,
                     style: TextStyle(fontWeight: FontWeight.bold,
                     fontFamily: 'ElMessiri',
                     fontSize: 18,
                     color:  isDark 
                     ? AppColor.ColorTextB 
                     : AppColor.ColorText ,),
                     )
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: IconButton(
                     icon: Icon(  isExpanded
                         ? CupertinoIcons.arrowtriangle_down_circle_fill
                         : CupertinoIcons.arrowtriangle_up_circle_fill,
                     color: isDark? AppColor.ColorTextB :AppColor.ColorText,
                     size: 27,),
                     onPressed:(() =>  setState(() {
                       isExpanded = !isExpanded;
                     })
                   ),
                 ),
              )],
             ),
             AnimatedCrossFade(
               firstChild:
                Text(
                 '',
                 style: TextStyle(
                   fontSize: 0,
                 ),
               ),
               secondChild: InkWell(
                 borderRadius: const BorderRadius.all(
                     Radius.circular(25),),
               highlightColor: const Color.fromARGB(255, 36, 156, 254),
               splashColor: const Color.fromARGB(255, 36, 149, 254),
               onTap: (){
                  setState(() {
             _makePhoneCall('${widget.route}');
            }); },
                 child:Text(
                 widget.em_number,
                 style: TextStyle(
                   color: isDark? AppColor.ColorTextB :AppColor.ColorText,
                   fontSize: 15.7,
                 ),
               ),),
               crossFadeState: isExpanded
                   ? CrossFadeState.showFirst
                   : CrossFadeState.showSecond,
               duration: Duration(milliseconds: 1200),
               reverseDuration: Duration.zero,
               sizeCurve: Curves.fastLinearToSlowEaseIn,
             ),
           ],
         ),
       ),
     );
      
  }
}










