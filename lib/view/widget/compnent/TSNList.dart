// ignore_for_file: non_constant_identifier_names, library_prefixes, prefer_typing_uninitialized_variables, file_names, prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Tasawe7/controller/core/constants/color.dart';



class TSNList extends StatefulWidget {

final gov_name;
final electric_num;
final water_num;
final gas_num;
TSNList({Key? key,  

this.gov_name,
this.electric_num,
this.water_num,
this.gas_num

  }) : super(key: key);


  @override
  State<TSNList> createState() => _TSNListState();
  
}

class _TSNListState extends State<TSNList> {
bool isExpanded = false;
  @override
  void initState() {
    super.initState();
    setState(() {
                isExpanded = !isExpanded;
              });
  }
  @override
  Widget build(BuildContext context) {
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
                height: isExpanded ? 80 : 200,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.gov_name,
                            style: TextStyle(
                              color: isDark? AppColor.ColorTextB :AppColor.ColorText,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            isExpanded
                                ? CupertinoIcons.arrowtriangle_down_circle_fill
                                : CupertinoIcons.arrowtriangle_up_circle_fill,
                            color: isDark? AppColor.ColorTextB :AppColor.ColorText,
                            size: 27,
                          ),
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
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "رقم اعطال الكهرباء",
                                style: TextStyle(
                                  color: isDark? AppColor.ColorTextB :AppColor.ColorText,
                                  fontSize: 15.7,
                                ),
                              ),
                              Text(
                                widget.electric_num,
                                style: TextStyle(
                                  color: isDark? AppColor.ColorTextB :AppColor.ColorText,
                                  fontSize: 15.7,
                                ),
                              ),
                            ],
                          ),
                          Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "رقم اعطال الغاز",
                                style: TextStyle(
                                  color: isDark? AppColor.ColorTextB :AppColor.ColorText,
                                  fontSize: 15.7,
                                ),
                              ),
                              Text(
                                widget.gas_num,
                                style: TextStyle(
                                  color: isDark? AppColor.ColorTextB :AppColor.ColorText,
                                  fontSize: 15.7,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "رقم اعطال المياه",
                                style: TextStyle(
                                  color: isDark? AppColor.ColorTextB :AppColor.ColorText,
                                  fontSize: 15.7,
                                ),
                              ),
                              Text(
                                widget.water_num,
                                style: TextStyle(
                                  color: isDark? AppColor.ColorTextB :AppColor.ColorText,
                                  fontSize: 15.7,
                                ),
                              ),
                            ],
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
      
  }
}










