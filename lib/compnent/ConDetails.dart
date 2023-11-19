//ignore_for_file: must_be_immutable, file_names, library_prefixes
import 'package:flutter/material.dart';
import 'package:Tasawe7/services/color.dart' as AppColors;







class ConDetails extends StatelessWidget {
  
  var text1='';
  ConDetails({Key? key, 


  required this.text1,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 bool isDark = Theme.of(context).brightness == Brightness.dark;

    return 
  
  
SizedBox(
  width: MediaQuery.of(context).size.width,
child:
Material(
color: Colors.transparent,
child:
InkWell(child:
Container( width: MediaQuery.of(context).size.width,
               
    padding: const EdgeInsets.all(15),
   child:
    Card(color: Colors.transparent,
       elevation: 0,
       child:      
        Row(children: <Widget>[
        Expanded(flex: 2, child: 
        Container(
          width: MediaQuery.of(context).size.width,
           alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(  
         topLeft:     Radius.circular(20),
         topRight:    Radius.circular(20),
         bottomLeft:  Radius.circular(20),
         bottomRight: Radius.circular(20), ),
          boxShadow: [
         BoxShadow(
         color: isDark  
         ?AppColors.ColorConShadowB
          :AppColors.ColorConShadow,
         blurRadius: 10.0),],
            gradient: LinearGradient(
            begin:   isDark
                          ?  Alignment.topLeft  :  Alignment.center ,
                          end:  isDark
                          ?  Alignment.bottomRight  : Alignment.center,
                          colors: isDark
                              ? AppColors.ColorConB
                              : AppColors.ColorConW,  
        )
      ),
      
    
     child:    Column(
     mainAxisAlignment: MainAxisAlignment.start,
     children: <Widget> [
   
   
         Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: 
         RichText(
            text: TextSpan(
            style: TextStyle(fontWeight: FontWeight.bold,
            fontFamily: 'cairo',
            color:  isDark 
            ? AppColors.ColorTextB 
            : AppColors.ColorText ,),
            children: <TextSpan>[
            TextSpan(text: text1),
           
             ]
             )
             ),
          )
     
        ])))])
        )),
    // onTap: onTap,
     
     )
     ));
    }
}











// class ConInquiry extends StatelessWidget {

// final Widget child;
// final Function() onTap;
// var image = Image.asset("",fit: BoxFit.cover,);
// var text='';
// ConInquiry({

//   required this.child,
//   required this.onTap,
//   required this.image,
//   required this.text,
// });

//   @override
//   Widget build(BuildContext context) {
//    bool isDark = Theme.of(context).brightness == Brightness.dark;

//     return
    
    
// Container(
//   width: MediaQuery.of(context).size.width,
// child:
// Material(
// color: Colors.transparent,
// child:
// InkWell(child:
// Container(  width: MediaQuery.of(context).size.width,
               
//     padding: EdgeInsets.all(10),
//    child:
//     Card(color: Colors.transparent,
//        elevation: 0,
//        child:      
//         Row(children: <Widget>[
//         Expanded(flex: 2, child: 
//         Container(
//           width: MediaQuery.of(context).size.width,
          
//            alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(  
//          topLeft:     Radius.circular(100),
//          topRight:    Radius.circular(0),
//          bottomLeft:  Radius.circular(100),
//          bottomRight: Radius.circular(150), ),
//           boxShadow: [
//          BoxShadow(
//          color: isDark
//           ?AppColors.ColorCarDTalabatShadowB
//           :AppColors.ColorCarDTalabatShadow,
//          blurRadius: 10.0),],
//             gradient: LinearGradient(
//              begin:   isDark
//                           ?  Alignment.topLeft  :  Alignment.center ,
//                           end:  isDark
//                           ?  Alignment.bottomRight  : Alignment.center,
//                           colors: isDark
//                               ? AppColors.ColorConB
//                               : AppColors.ColorConW,
//         )
//       ),

//      child:    Column(
//     mainAxisAlignment: MainAxisAlignment.center,  
//      children: <Widget> [
     
//      Container(
//       padding: EdgeInsets.symmetric(vertical: 20),
//       child: 
//      Text(text,style: TextStyle( 
//       color:  isDark 
//       ? AppColors.ColorTextB
//       : AppColors.ColorText ,
//        fontWeight: FontWeight.bold),
//        textAlign: TextAlign.center,))
    
     
//         ])))])
//         )),
//      onTap: onTap,
     
//      )
//      ));
//     }
// }


