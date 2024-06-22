//ignore_for_file: must_be_immutable, file_names, library_prefixes
import 'package:flutter/material.dart';
import 'package:Tasawe7/controller/core/constants/color.dart' ;




class ConDetails extends StatelessWidget {
  
  var text1='';
  ConDetails({Key? key, 
  required this.text1,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 bool isDark = Theme.of(context).brightness == Brightness.dark;

    return 
  
  
Container(
  width: MediaQuery.of(context).size.width,
margin: const EdgeInsets.all(30),
padding: const EdgeInsets.all(20),
decoration: BoxDecoration(
  borderRadius: const BorderRadius.only(  
 topLeft:     Radius.circular(20),
 topRight:    Radius.circular(20),
 bottomLeft:  Radius.circular(20),
 bottomRight: Radius.circular(20), ),
  boxShadow: [
 BoxShadow(
 color: isDark  
  ?AppColor.ColorConShadowB
  :AppColor.ColorConShadow,
 blurRadius: 10.0),],
    gradient: LinearGradient(
    begin:   isDark
                  ?  Alignment.topCenter  :  Alignment.topCenter ,
                  end:  isDark
                  ?  Alignment.bottomCenter  : Alignment.bottomCenter,
                  colors: isDark
                      ? AppColor.ColorConB
                      : AppColor.ColorConW,  
)
  ),
  

 child:   
 RichText(
text: TextSpan(
style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'ElMessiri',
color:  isDark 
? AppColor.ColorTextB 
: AppColor.ColorText ,),
children: <TextSpan>[
TextSpan(text: text1),
   
 ]
 )
 ),
  );
    }
}




class ConNews extends StatelessWidget {
  
  // String link;
  String title;

  ConNews({Key? key, 
  // required this.link,
  required this.title,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 bool isDark = Theme.of(context).brightness == Brightness.dark;

    return 
  
  
Container(
  width: MediaQuery.of(context).size.width,
margin: const EdgeInsets.all(30),
padding: const EdgeInsets.all(20),
decoration: BoxDecoration(
  borderRadius: const BorderRadius.only(  
 topLeft:     Radius.circular(20),
 topRight:    Radius.circular(20),
 bottomLeft:  Radius.circular(20),
 bottomRight: Radius.circular(20), ),
  boxShadow: [
 BoxShadow(
 color: isDark  
  ?AppColor.ColorConShadowB
  :AppColor.ColorConShadow,
 blurRadius: 10.0),],
    gradient: LinearGradient(
    begin:   isDark
                  ?  Alignment.topCenter  :  Alignment.topCenter ,
                  end:  isDark
                  ?  Alignment.bottomCenter  : Alignment.bottomCenter,
                  colors: isDark
                      ? AppColor.ColorConB
                      : AppColor.ColorConW,  
)
  ),
  

 child:   
      RichText(
      text: TextSpan(
      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'ElMessiri',
      color:  isDark 
      ? AppColor.ColorTextB 
      : AppColor.ColorText ,),
      children: <TextSpan>[
      TextSpan(text: title),
        
      ]
      )
      ),
        );
    }
}




