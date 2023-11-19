// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names, unused_local_variable, library_prefixes, avoid_print

import 'dart:convert';

import 'package:Tasawe7/compnent/SpinningCircler.dart';
import 'package:flutter/material.dart';
import 'package:Tasawe7/compnent/Bar.dart';
import 'package:Tasawe7/compnent/EmergencyList.dart';
import 'package:flutter/services.dart';
// import 'package:Tasawe7/services/color.dart' as AppColor;
import 'package:http/http.dart' as http;
 import 'package:Tasawe7/services/api.dart' ;



class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
    // const Emergency({Key? key}) : super(key: key);
   
  
  Future getEmergencyData() async{
    var url = Uri.parse(Api+'SelectEmergencyData.php');
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
       if (responsebody != null) {
         print(responsebody);
    return responsebody;
       }
    print("Error");

  }

//  List<dynamic> listsearch = [];

//  Future getData() async {
//     // var url = Uri.parse('http://192.168.43.128:8081/Tasawe7/Search.php');
//     var url = Uri.parse(Api+'Search.php');
//     var response = await http.get(url);
//     var responsebody = jsonDecode(response.body);
//     for ( int i = 0; i < responsebody.length; i++) {
//      listsearch.add(responsebody[i]['Emergency']); 
//    }
//     print(listsearch);
//     return responsebody;
//   }


 @override
 void initState() {
 getEmergencyData();
   super.initState();
 }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.transparent
));


    final double screenHeigh = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    
    return  Bar3( 
      title: "ارقام الطوارئ" ,
       //drawer: Drawer(),
       
            //   acction: [
            //   IconButton(
            //     padding: EdgeInsets.all(15),
            //     onPressed: (() {
            //   showSearch(context: context, delegate: Search(list: listsearch)); 
            //  }), icon:Icon(Icons.search_rounded ,
            //      color: isDark
            //      ? AppColor.ColorTextB
            //      : AppColor.ColorText,))],
              // child:Container(),
           
        child: 
        FutureBuilder(
        future: getEmergencyData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
            return  ListView.builder(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //  crossAxisSpacing: 1, crossAxisCount: 2),
           physics:  BouncingScrollPhysics(
           parent: AlwaysScrollableScrollPhysics()),
           itemCount: snapshot.data.length,
           itemBuilder: (context, i) {

           return  
           
           EmergencyList(
            em_name:     snapshot.data[i]["em_name"],
            em_number:   snapshot.data[i]['em_number'],
           );
           
                });
          }

          return Center(child: SpinningCircler());
        },
      ) 
      );
        
  }
}






// class  Search extends SearchDelegate {
 
//    List<dynamic> list  ;

//    Search({
//     required this.list
//    });
   

//     Future getSearchData() async {
//     var url = Uri.parse(Api+'SearchData.php');
//     var data = {"SearchEmergency" : query};
//     var response = await http.post(url , body: data);
//     var responsebody = jsonDecode(response.body);
//     return responsebody;
//   }


//   @override
//   List<Widget>? buildActions(BuildContext context) {

//    return [
//          IconButton(onPressed: (){
//           query = "";
//          } , icon: Icon(Icons.close_sharp))
//    ];

//   }

//   @override
//   Widget? buildLeading(BuildContext context) {


//     return IconButton(onPressed: () {
//       close(context,  null );
//     },  icon: Icon(Icons.arrow_back_ios_new));

//   }

//   @override
//   Widget buildResults(BuildContext context) {
   

//      return  FutureBuilder(
//        future: getSearchData(),
//        builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//             itemCount: snapshot.data.length,
//             itemBuilder: (context, i) {
//               return  EmergencyList(
//              Emergency:  snapshot.data[i]['Emergency'],
//              Details:  snapshot.data[i]['Details'],
//            );
//             },
//           );
//         }
//             return Center(child: CircularProgressIndicator());
//        },
//      );  



//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
    
        
//       var searchlist = query.isEmpty ? list : list.where((element) => element.toLowerCase().contains(query)).toList();
//             // ((element) => Element.startwith(query)).toList() ;

//     return  ListView.builder(
//        itemCount: searchlist.length,
//        itemBuilder: (context , i) {
//         return  
//            ListTile(
//             leading: Icon(Icons.arrow_forward_ios_outlined),
//             title: Text("${searchlist[i]}"),
//             onTap: () {
//              query =   query == "" ?   searchlist[i] : searchlist[i];
//             showResults(context);
//           }
//         );
//        }, 
//      );
                 
  


//   }
  
// }






