// ignore_for_file: file_names

import 'package:Tasawe7/controller/core/function/statusrequest.dart';

handlingData(response){
 if (response is StatusRequest) {
  return response ;
 }else{
  return StatusRequest.success ; 
 }
}