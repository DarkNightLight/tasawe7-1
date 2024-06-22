// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:Tasawe7/controller/core/function/checkinternet.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeController extends GetxController{

updateHomePage();

}

class HomeControllerInp extends GetxController{
  var name1 = ''.obs;
  var supports1 = ''.obs;

 
   
  RxInt  user = 0 .obs; 
  RxInt loading = 0.obs;
  var name ;
  var supports ; 

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    name     = preferences.getString("name");
    supports = preferences.getString("supports");
  }
  
  

void updateHomePage() {
    name1.value = name ;
    supports1.value = supports ;
    update();
  }



  void navigate () async {
  try{
     SharedPreferences preferences = await SharedPreferences.getInstance();
     var email=  preferences.getString("email");
     if(email != null && email !="")
       { 
        loading=1.obs;
      }
      else {
        loading=2.obs;
      }

    }catch(ex){
      loading=2.obs;
    }


    if (name != null && name != "") {
        user = 1 .obs;
      }

      update();
}


 var res ;
  initialData() async{
    res = await checkInternet();
        print(res);
  }

@override
  void onInit() {
    user = 0.obs ;
      loading=0.obs;
      navigate();
      getPref();
    initialData();
    update();
    super.onInit();
  }
  
}


