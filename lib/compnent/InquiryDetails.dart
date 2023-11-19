// ignore_for_file: non_constant_identifier_names, file_names, library_prefixes, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:Tasawe7/compnent/Bar.dart';
import 'package:flutter/material.dart';
import 'package:Tasawe7/compnent/ConDetails.dart';
// import 'package:Tasawe7/compnent/Painter.dart';
// import 'package:Tasawe7/services/color.dart' as AppColor;






class InquiryDetails extends StatefulWidget {

  final Inquiry;
  final Details;  
  InquiryDetails ({Key? key, 
    this.Inquiry,
    this.Details,
  }) : super(key: key);

  @override
  _InquiryDetailsState createState() => _InquiryDetailsState();


}

class _InquiryDetailsState extends State<InquiryDetails> {
  


  @override
  Widget build(BuildContext context) {


    return Bar3(title: widget.Inquiry, 
           
        child: ConDetails(
        text1:   widget.Details, 
        )
        
        
        );
  }
}
