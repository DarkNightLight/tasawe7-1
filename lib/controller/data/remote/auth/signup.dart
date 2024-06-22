// ignore_for_file: file_names

import 'package:Tasawe7/controller/core/constants/api.dart';
import 'package:Tasawe7/controller/core/function/crud.dart';

class SignupData {
  Crud crud ;
  SignupData( this.crud );
  postData ( String name , String email , String password , String phone , String address , var token) async {
    var response = await  crud.postData(Api.registration, {
       "name":       name ,
       "email":      email ,
       "password" :  password ,
       "phone" :     phone ,
       "address" :   address ,
       "token" :   token ,
    });
     return  response.fold((l) => l, (r) => r);
  }
}