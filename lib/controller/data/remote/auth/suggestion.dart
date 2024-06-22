// ignore_for_file: file_names, non_constant_identifier_names

import 'package:Tasawe7/controller/core/constants/api.dart';
import 'package:Tasawe7/controller/core/function/crud.dart';

class SuggestionData {
  Crud crud ;
  SuggestionData( this.crud );
  postData (  String content  ,  user_email) async {
    var response = await  crud.postData(Api.suggestions, {
       "content":      content ,
       "user_email" :  user_email ,
    });
     return  response.fold((l) => l, (r) => r);
  }
}