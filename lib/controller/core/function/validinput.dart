import 'package:get/get.dart';

validinput( String val , int min , int max , String type ){
  if (type == "username") {
    if (val.isEmpty) {
    return "لا يمكن ان يترك فارغ" ;
  }

  }
  if (type == "email") {
    if (val.isEmpty) {
    return "لا يمكن ان يترك فارغ" ;
  }
    if (!GetUtils.isEmail(val)) {
      if (val.isEmpty) {
    return "لا يمكن ان يترك فارغ" ;
  }
      return " ليس بريد الكتروني " ;
    }
  }
  if (type == "phone") {
    if (val.isEmpty) {
    return "لا يمكن ان يترك فارغ" ;
  }
    if (!GetUtils.isPhoneNumber(val)) {
      return " ليس رقم هاتف " ;
    }
  }
  if (val.isEmpty) {
    return "لا يمكن ان يترك فارغ" ;
  }
  if (val.length < min) {
    return " لا يجب ان تكون اصغر من  $min" ;
  }
  if (val.length > max) {
    return " لا يجب ان تكون اكبر من  $max" ;
  }


}