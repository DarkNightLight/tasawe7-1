// ignore_for_file: file_names

import 'package:Tasawe7/controller/core/constants/api.dart';
import 'package:Tasawe7/controller/core/function/crud.dart';

class LoginData {
  Crud crud ;
  LoginData( this.crud );
  postData (  String email , String password ,  token) async {
    var response = await  crud.postData(Api.logIn, {
       "email":      email ,
       "password" :  password ,
       "token" :     token ,
    });
     return  response.fold((l) => l, (r) => r);
  }
}