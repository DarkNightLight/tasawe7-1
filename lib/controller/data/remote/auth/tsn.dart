// ignore_for_file: file_names

import 'package:Tasawe7/controller/core/constants/api.dart';
import 'package:Tasawe7/controller/core/function/crud.dart';

class TSNData {
  Crud crud ;
  TSNData( this.crud );
  getData () async {
    var response = await  crud.postData(Api.getTSN, {});
     return  response.fold((l) => l, (r) => r);
  }
}