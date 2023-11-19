// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../functions/fetchrates.dart';
import 'package:Tasawe7/services/color.dart' as AppColor;


class UsdToAny extends StatefulWidget {
  final rates;
  final Map currencies;
  const UsdToAny({Key? key, @required this.rates, required this.currencies})
      : super(key: key);

  @override
  _UsdToAnyState createState() => _UsdToAnyState();
}

class _UsdToAnyState extends State<UsdToAny> {
  TextEditingController usdController = TextEditingController();
  String dropdownValue = 'AUD';
  String answer = 'قيمة العملة المحولة ستظهر هنا :)';

  @override
  Widget build(BuildContext context) {
    bool isTapped = false;
    var _w = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return 
    
Padding(
      padding: EdgeInsets.only(
        top:  _w / 50,
        bottom: _w / 50,
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
        child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               const SizedBox(),
               Column(
                 children: [
                   Container(child: Container(
             // width: w / 3,
             padding: EdgeInsets.all(10),
             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Text(
                     'من دولار لأي عملة أخرى',
                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                   ),
                   SizedBox(height: 20),

                   //TextFields for Entering USD
 Row(
   children: [
     Padding(
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
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextFormField(
                  key: ValueKey('usd'),
                 maxLines: null,
                  
                  style: TextStyle(color:isDark
                  ? AppColor.ColorTxtFieldinputLogB
                  :AppColor.ColorTxtFieldinputLog),
                  cursorColor: isDark
                  ? AppColor.ColorTxtFieldinputLogB
                  :AppColor.ColorTxtFieldinputLog,
                  controller: usdController ,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    
                    isDense: true,
                    contentPadding: EdgeInsets.all(5),
                    
                    border: InputBorder.none,
                    hintMaxLines: 1,
                    hintText: 'أدخل قيمة الدولار',
                    
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




                  Expanded(
                    flex: 2,
                         child: DropdownButton<String>(
                          
                          borderRadius: BorderRadius.circular(10),
                          menuMaxHeight: _w/1.5,
                          dropdownColor:isDark?Color.fromARGB(108, 0, 0, 0) : Color.fromARGB(191, 255, 255, 255),
                           value: dropdownValue,
                           icon:  Icon(CupertinoIcons.arrowtriangle_down_circle_fill,
                           color: isDark
                            ? AppColor.ColorTextB
                            : AppColor.ColorText,),
                           iconSize: 24,
                           elevation: 16,
                           isExpanded: true,
                           underline: Container(
                             height: 1,
                             color: isDark? Color.fromARGB(255, 255, 255, 255) : Colors.black,
                           ),
                           onChanged: (String? newValue) {
                             setState(() {
                               dropdownValue = newValue!;
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
                       SizedBox(
                         width: 10,
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
                               answer = usdController.text +
                                   ' USD = ' +
                                   convertusd(widget.rates, usdController.text,
                                       dropdownValue) +
                                   ' ' +
                                   dropdownValue;
                             }); 
              
                        } ,
              
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
                          :  [  Color.fromARGB(255, 242, 241, 251), Color.fromARGB(255, 97, 165, 199)],
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
        )
   ],
 ),
                  //  TextFormField(
                  //    key: ValueKey('usd'),
                  //    controller: usdController,
                  //    decoration: InputDecoration(hintText: 'أدخل قيمة الدولار'),
                  //    keyboardType: TextInputType.number,
                  //  ),

                   
                  //  SizedBox(height: 10),
                  //  Row(
                  //    children: [
                  //      //Future Builder for getting all currencies for dropdown list
                  //      Expanded(
                  //        child: DropdownButton<String>(
                  //          value: dropdownValue,
                  //          icon: const Icon(Icons.arrow_drop_down_rounded),
                  //          iconSize: 24,
                  //          elevation: 16,
                  //          isExpanded: true,
                  //          underline: Container(
                  //            height: 2,
                  //            color: Colors.grey.shade400,
                  //          ),
                  //          onChanged: (String? newValue) {
                  //            setState(() {
                  //              dropdownValue = newValue!;
                  //            });
                  //          },
                  //          items: widget.currencies.keys
                  //              .toSet()
                  //              .toList()
                  //              .map<DropdownMenuItem<String>>((value) {
                  //            return DropdownMenuItem<String>(
                  //              value: value,
                  //              child: Text(value),
                  //            );
                  //          }).toList(),
                  //        ),
                  //      ),
                  //      SizedBox(
                  //        width: 10,
                  //      ),

                  //      //Convert Button
                    
                    
                    
                  //     //  ElevatedButton(
                  //     //    onPressed: () {
                  //     //      setState(() {
                  //     //        answer = usdController.text +
                  //     //            ' USD = ' +
                  //     //            convertusd(widget.rates, usdController.text,
                  //     //                dropdownValue) +
                  //     //            ' ' +
                  //     //            dropdownValue;
                  //     //      });
                  //     //    },
                  //     //    child: Text('تحويل'),
                  //     //    style: ButtonStyle(
                  //     //        backgroundColor: MaterialStateProperty.all(
                  //     //            Theme.of(context).primaryColor)),
                  //     //  ),

                      
                  //      SizedBox(
                  //        width: 10,
                  //      ),
                  //    ],
                  //  ),

                   //Final Output
                   SizedBox(height: 10),
                   Padding(
                     padding: const EdgeInsets.only(top: 20),
                     child: Center(child: Container(child: Text(answer))),
                   )
                 ]))) ,
                   
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