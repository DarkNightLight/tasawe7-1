
// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../functions/fetchrates.dart';
import 'package:Tasawe7/services/color.dart' as AppColor;

class AnyToAny extends StatefulWidget {
  final rates;
  final Map currencies;
  const AnyToAny({Key? key, @required this.rates, required this.currencies})
      : super(key: key);

  @override
  _AnyToAnyState createState() => _AnyToAnyState();
}

class _AnyToAnyState extends State<AnyToAny> {
  TextEditingController amountController = TextEditingController();

  String dropdownValue1 = 'AUD';
  String dropdownValue2 = 'AUD';
  String answer = 'قيمة العملة المحولة ستظهر هنا :)';

  @override
  Widget build(BuildContext context) {
    bool isTapped = false;
    var _w = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.only(
        top:  _w / 50,
        bottom: _w / 20,
        left:  _w / 30,
        right:  _w / 30,),
      
        
          child: Container(
            //  padding: EdgeInsets.all(15),
            height: _w / 1.2,
            // width: _w / ,
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
        child: Container(
        // width: w / 3,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'تحويل من عملة لأي عملة أخرى',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 20),     Padding(
       padding: const EdgeInsets.only(right: 5),
       child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter( 
              filter: ImageFilter.blur(
                sigmaY: 20,
                sigmaX: 20,
              ),
              child: Container(
                height: _w / 6,
                width: _w / 3,
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: _w/ 10),
                decoration: BoxDecoration(
              //      boxShadow:[
              //  BoxShadow(
              //  color: isDark 
              //  ? Colors.teal 
              //  : Colors.teal ,
              //  blurRadius: 1.0),],
              gradient: LinearGradient(
                          begin: isDark ?
                          Alignment.centerLeft:Alignment.centerLeft,
                          end:isDark ?
                          Alignment.centerRight:Alignment.centerRight,
                          colors: isDark
                          ?   [Color.fromARGB(255, 36, 156, 254) , Color.fromARGB(248, 146, 14, 161)  ]
                          :  [  Color.fromARGB(255, 242, 241, 251), Color.fromARGB(255, 97, 165, 199)],
                          ),
                  color:isDark
                  ? AppColor.ColorTxtFieldBoxDecB
                  :AppColor.ColorTxtFieldBoxDecB,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  key: ValueKey('amount'),
                 maxLines: null,
                  
                  style: TextStyle(color:isDark
                  ? AppColor.ColorTxtFieldinputLogB
                  :AppColor.ColorTxtFieldinputLog),
                  cursorColor: isDark
                  ? AppColor.ColorTxtFieldinputLogB
                  :AppColor.ColorTxtFieldinputLog,
                  controller: amountController ,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    
                    isDense: true,
                    contentPadding: EdgeInsets.all(5),
                    
                    border: InputBorder.none,
                    hintMaxLines: 1,
                    hintText: ' أدخل القيمة ',
                    
                    hintStyle:
                        TextStyle( color:isDark
                  ? AppColor.ColorTxtFieldinputLogB
                  :AppColor.ColorTxtFieldinputLog),
                  ),
                ),
              ),
            ),
          ),
     ),
            //TextFields for Entering USD
           
            // TextFormField(
            //   key: ValueKey('amount'),
            //   controller: amountController,
            //   decoration: InputDecoration(hintText: 'أدخل القيمة'),
            //   keyboardType: TextInputType.number,
            // ),


            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    dropdownColor:isDark? Color.fromARGB(108, 0, 0, 0) :  Color.fromARGB(191, 255, 255, 255),
                    value: dropdownValue1,
                    icon:  Icon(CupertinoIcons.arrowtriangle_down_circle_fill ,
                    color: isDark
                    ? AppColor.ColorTextB
                    : AppColor.ColorText,),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 1,
                      color: isDark
                      ? AppColor.ColorTextB
                      : AppColor.ColorText,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue1 = newValue!;
                      });
                    },
                    items: widget.currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('الى')),
                Expanded(
                  child: DropdownButton<String>(
                    dropdownColor:isDark? Color.fromARGB(108, 0, 0, 0) : Color.fromARGB(191, 255, 255, 255),
                    value: dropdownValue2,
                    icon:  Icon(CupertinoIcons.arrowtriangle_down_circle_fill,
                    color: isDark
                    ? AppColor.ColorTextB
                    : AppColor.ColorText,),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 1,
                      color:  isDark
                      ? AppColor.ColorTextB
                      : AppColor.ColorText,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue2 = newValue!;
                      });
                    },
                    items: widget.currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
          
          
              Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(vertical:  5 , horizontal: 5),
                    child: Center(
                      
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onHighlightChanged: (value) {
                        setState(() {
                          isTapped = value;
                        });
                      },
                      onTap: ()async {
                            
                        setState(() {
                          answer = amountController.text +
                              ' ' +
                              dropdownValue1 +
                              ' ' +
                              convertany(widget.rates, amountController.text,
                                  dropdownValue1, dropdownValue2) +
                              ' ' +
                              dropdownValue2;
                        });
                      },
              
                      child: AnimatedContainer(
                        
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: isTapped ? 65 : 70,
                        width: isTapped ? 60 : 70,
        
        
                        // height: isTapped ? 55 : 60,  
                        // width: isTapped ? 150 : 160,
        
        
                        decoration: BoxDecoration(
                         gradient: LinearGradient(
                          begin: isDark ?
                          Alignment.centerLeft:Alignment.centerLeft,
                          end:isDark ?
                          Alignment.centerRight:Alignment.centerRight,
                          colors: isDark
                          ?   [Color.fromARGB(255, 36, 156, 254) , Color.fromARGB(248, 146, 14, 161)  ]
                          :  [  Color.fromARGB(255, 242, 241, 251),  Color.fromARGB(255, 97, 165, 199)],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(200),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:isDark 
                              ? AppColor.ColorResponsiveButtonShadowB 
                              : AppColor.ColorResponsiveButtonShadow ,
                              blurRadius: 30,
                              offset: Offset(3, 7),
                            ),
                          ],
                        ),
                        child: Center(
                          
                          
                        child:Icon(CupertinoIcons.chevron_forward, 
                        color:isDark 
                              ? AppColor.ColorResponsiveButtonTxTB 
                              : AppColor.ColorResponsiveButtonTxT ,) 
                          
                          
                          
                          
                          
                          // Text(
                          //  "${getLang(context, "TitleSend")}",
                          //   style: TextStyle(
                          //     color:isDark 
                          //     ? AppColors.ColorResponsiveButtonTxTB 
                          //     : AppColors.ColorResponsiveButtonTxTB ,
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          // ),
        
        
        
                        ),
                      ),
                    ),
                ),
                      ),
        ),
              
              ],
            ),

            SizedBox(height: 10),
           
           



            // Container(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       setState(() {
            //         answer = amountController.text +
            //             ' ' +
            //             dropdownValue1 +
            //             ' ' +
            //             convertany(widget.rates, amountController.text,
            //                 dropdownValue1, dropdownValue2) +
            //             ' ' +
            //             dropdownValue2;
            //       });
            //     },
            //     child: Text('تحويل'),
            //     style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.all(
            //             Theme.of(context).primaryColor)),
            //   ),
            // ),



            SizedBox(
              width: 10,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(child: Container(child: Text(answer))),
            )
          ],
        ),
      ))));
  }
}