// ignore_for_file: prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, prefer_const_constructors, unnecessary_new

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Tasawe7/services/color.dart' as AppColor;
 import 'package:Tasawe7/services/api.dart' ;
import '../compnent/Bar.dart';

class Suggestions extends StatefulWidget {


     
  @override
  State<Suggestions> createState() => _SuggestionsState();

}
class _SuggestionsState extends State<Suggestions> {
   

  //  String compvalidate(String val) {
  //   if (val.trim().isEmpty) {
  //     return  "برجاء كتابة التعديل أو الإقتراح " ;
  //   }
  // }
 

   TextEditingController _content = new TextEditingController();
  
   GlobalKey<FormState>  formStateComp   = new GlobalKey<FormState>();

      Future insert() async {
       var formdata = formStateComp.currentState;
       if (formdata!.validate()) {
       
      var data = {  "content" : _content.text };
      var url = Uri.parse(Api +"Suggestions.php");
      var response = await http.post(url, body: data);
     var responsebody = jsonDecode(response.body);
     if (responsebody['status'] == "success") {
      
        print(responsebody);
     //    bool isDark = Theme.of(context).brightness == Brightness.dark;
        // Navigator.of(context).pushNamed('HomePage');
        // AwesomeDialog(context: context,  
        // autoHide: Duration(seconds: 5),
        // dialogType: DialogType.SUCCES,

        // dialogBackgroundColor:   isDark 
        //     ? AppColor.ColorAwseomeDialogBGB 
        //     : AppColor.ColorAwseomeDialogBG ,
        // title: "",
        // dismissOnTouchOutside: true,
        //  body: 
        // Center(child: Text("تم الارسال",
        // style: TextStyle(
        // color: isDark 
        //     ? AppColor.ColorAwseomeDialogTxtB 
        //     : AppColor.ColorAwseomeDialogTxt ,
        //  fontWeight: FontWeight.bold),
        //  textAlign: TextAlign.center,))).show();
     }
     }
      }

      bool isTapped = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      isTapped = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _w = MediaQuery.of(context).size.width;
 bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Bar3(
              title: "الاقتراحات",
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
        child: SingleChildScrollView(
          child: Column(children: [
               ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter( 
        filter: ImageFilter.blur(
          sigmaY: 20,
          sigmaX: 20,
        ),
        child: Container(
          height: _w / 6,
          width: _w / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: _w / 30),
          decoration: BoxDecoration(
             boxShadow:[
         BoxShadow(
         color: isDark 
         ? AppColor.ColorResponsiveButtonShadowB 
         : AppColor.ColorResponsiveButtonShadow  ,
         blurRadius: 30.0),],
            color:isDark
            ? AppColor.ColorTxtFieldBoxDecB
            :AppColor.ColorTxtFieldBoxDecB,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Form(
            key: formStateComp,
            child: TextFormField(
              textAlign: TextAlign.center,
              maxLines: null,

              validator: (val) {
                        if (val!.trim().isEmpty) {
                          return  "برجاء كتابة التعديل أو الإقتراح قبل الضغط على تسجيل الإقتراح" ;
                        }
                          return null;
                      },
              
              style: TextStyle(
                color:isDark
              ? AppColor.ColorTxtFieldinputLogB
              :AppColor.ColorTxtFieldinputLog),
              cursorColor: isDark
              ? AppColor.ColorTxtFieldinputLogB
              :AppColor.ColorTxtFieldinputLog,
              controller: _content ,
             
          
              decoration: InputDecoration(
                
                isDense: true,
                contentPadding: EdgeInsets.all(10),
                
                border: InputBorder.none,
                hintMaxLines: 1,
                hintText: "برجاء كتابة التعديل أو الإقتراح ",
                hintStyle:
                    TextStyle( 
                      color:isDark
              ? AppColor.ColorTxtFieldinputLogB
              :AppColor.ColorTxtFieldinputLog, ),
              ),
            ),
          ),
        ),
      ),
    ),



            // TextFormField(
            //    decoration: InputDecoration(
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.all(Radius.circular(40))
            //               ),)

            // ),

              SizedBox(height: 5,),

              
               
               Padding(
          padding: const EdgeInsets.all(2.0),
          child:
          
          Container(
            width: _w/3,
            height: _w/3,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(vertical:  _w/10 , horizontal: 5),
                    child:
                    Center(
                      
                    child:
                     AnimatedContainer(
                          
                          duration: Duration(milliseconds: 300),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: isTapped ? _w/10 : _w/9 ,
                          width: isTapped ? _w/2.8 :_w/3,
                            
                            
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
                          child: 
                            Material(
      
        color: Color.fromARGB(0, 64, 233, 255),
                      child: InkWell(
                        
            borderRadius: const BorderRadius.all(
                Radius.circular(25),),
          highlightColor: Color.fromARGB(255, 36, 156, 254),
          splashColor: Color.fromARGB(255, 36, 149, 254),
            onHighlightChanged: (value) {
                          setState(() {
                            isTapped = value;
                          });
                        },
                        onTap: ()async {
                                setState(() {
                                insert();
                               }); 
                                  
                          } ,
                          child:Center(
                            
                            
                          child:Text("تسجيل الإقتراح", 
                                style: TextStyle( color:isDark 
                                ? AppColor.ColorResponsiveButtonTxTB 
                                : AppColor.ColorResponsiveButtonTxT ,) ,),
                            
                            
                            
                            
                                     
                            
                            
                          ),
                        ),
                      ),
                    ),
                ),
                      ),
        ),
            // MaterialButton(
            //               onPressed: (){
            //               // if(_formKey.currentState!.validate()){
            //               //   insert();}
            //                insert();
            //                 },
            //             minWidth:45,
            //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)) ,
            //              color: Colors.blueGrey,

            //              child: Text('تسجيل الإقتراح',style: TextStyle(fontSize: 18)),), 
          ]),
        )))
    );
  }
}