// ignore_for_file: non_constant_identifier_names, library_prefixes, prefer_typing_uninitialized_variables, file_names, prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tasawe7/services/color.dart' as AppColor;



class EmergencyList extends StatefulWidget {

final em_name;
final em_number;

EmergencyList({Key? key,  

this.em_name,
this.em_number,


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
// savePref(var Inquiry)
  @override
  Widget build(BuildContext context) {
        final double _w = MediaQuery.of(context).size.height;

     bool isDark = Theme.of(context).brightness == Brightness.dark;
     
    return           
     Directionality(textDirection: TextDirection.rtl,
       child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: AnimatedContainer(
                margin: EdgeInsets.symmetric(
                  horizontal: isExpanded ? 25 : 25,
                  vertical: 25,
                ),
                padding: EdgeInsets.all(15),
                height: isExpanded ? _w/11 : _w/7.6,
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
                        Text(
                          widget.em_name,
                          style: TextStyle(
                            color: isDark? AppColor.ColorTextB :AppColor.ColorText,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          isExpanded
                              ? CupertinoIcons.arrowtriangle_down_circle_fill
                              : CupertinoIcons.arrowtriangle_up_circle_fill,
                          color: isDark? AppColor.ColorTextB :AppColor.ColorText,
                          size: 27,
                        ),
                      ],
                    ),
                    isExpanded ? SizedBox() : SizedBox(height: 15),
                    AnimatedCrossFade(
     
                      firstChild: Text(
                        '',
                        style: TextStyle(
                          fontSize: 0,
                        ),
                      ),
                      secondChild: Column(
                        children: [

                          Text(
                            widget.em_number,
                            style: TextStyle(
                              color: isDark? AppColor.ColorTextB :AppColor.ColorText,
                              fontSize: 15.7,
                            ),
                          ),
                        ],
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
              ),
            ),
     );


   

         
            //  HomePageCard1(
            //    color: isDark
            //   ? AppColor.ColorTextB
            //   : AppColor.ColorText,
            //    context: context,
            //    route:  () {  HapticFeedback.lightImpact();
            //      Navigator.of(context).push(MaterialPageRoute(builder: (context){
            //     return EmergencyDetails( gov_name: gov_name , electric_num: electric_num, gas_num: gas_num , water_num : water_num);
            //     })); },
            //   //  icon: Icons.wallet_giftcard,
            //    title: gov_name);

      
  }
}










