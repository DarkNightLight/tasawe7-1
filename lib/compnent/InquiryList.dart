// ignore_for_file: non_constant_identifier_names, library_prefixes, prefer_typing_uninitialized_variables, file_names, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tasawe7/compnent/InquiryDetails.dart';



import 'package:Tasawe7/services/color.dart' as AppColor;

import 'HomePageCard.dart';



class InquiryList extends StatelessWidget {

final Inquiry;
final Details;
// final ID;
// final Added_Date;
InquiryList({Key? key,  
// this.ID,
this.Inquiry,
this.Details,
// this.Added_Date

}) : super(key: key);

// savePref(var Inquiry)
//   async{

//     SharedPreferences prefs = await SharedPreferences.getInstance();
    
//     prefs.setString("Inquiry", Inquiry);
//   }
  @override
  Widget build(BuildContext context) {
     bool isDark = Theme.of(context).brightness == Brightness.dark;

    return 




         
             HomePageCard1(
               color: isDark
              ? AppColor.ColorTextB
              : AppColor.ColorText,
               context: context,
               route:  () {  HapticFeedback.lightImpact();
                 Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return InquiryDetails( Inquiry: Inquiry , Details: Details,);
                })); },
              //  icon: Icons.wallet_giftcard,
               title: Inquiry);

      
  }
}










