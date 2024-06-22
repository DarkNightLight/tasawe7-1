// ignore_for_file: non_constant_identifier_names, library_prefixes, prefer_typing_uninitialized_variables, file_names, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tasawe7/view/widget/compnent/InquiryDetails.dart';



import 'package:Tasawe7/controller/core/constants/color.dart';

import 'HomePageCard.dart';



class InquiryList extends StatelessWidget {

final Inquiry;
final Details;
InquiryList({Key? key,  
this.Inquiry,
this.Details,

}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     bool isDark = Theme.of(context).brightness == Brightness.dark;

    return  HomePageCard1(
               color: isDark
              ? AppColor.ColorTextB
              : AppColor.ColorText,
               context: context,
               route:  () {  HapticFeedback.lightImpact();
                 Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return InquiryDetails( Inquiry: Inquiry , Details: Details,);
                })); },
               title: Inquiry);
  }
}










