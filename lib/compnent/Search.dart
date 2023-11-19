// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';




















/* كود الكونكشن بتاع السيرش

  //  var listsearch =[];

  // Future getData() async{
  //  var url = "http";
  //  var response = await http.get(url);
  //  var responsebody = jsonDecode(response.body);
  //  for ( int i = 0; i < responsebody.length; i++) {
  //    listsearch.add(responsebody[i]["الحقل اللي هتستعلم عنه"]);
  //  }
  //  print(listsearch);
  // }
  
*/





class  Search extends SearchDelegate {
 
   List <dynamic> list  ;

   Search({
    required this.list
   });
   

//  List names = [ 
//   " nnnn ",
//   " ffff ",
//   " ssss ",
//   " bbbb "
//  ];
 
  @override
  List<Widget>? buildActions(BuildContext context) {

   return [
         IconButton(onPressed: (){
          query = "";
         } , icon: Icon(Icons.close_sharp))
   ];

  }

  @override
  Widget? buildLeading(BuildContext context) {


    return IconButton(onPressed: () {
      close(context,  null );
    },  icon: Icon(Icons.arrow_back_ios_new));

  }

  @override
  Widget buildResults(BuildContext context) {
   
   
    return  
    Text(query) ;


  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    

      // List fillternames = names.where((element) => element.startwith(query)).toList() ;
      
      var fillterlist = query.isEmpty ?list : list.where((element) => element.startwith(query)).toList() ;

  
       

    return  ListView.builder(
      //  itemCount: query == "" ?   names.length : fillternames.length ,    
       itemCount:
       fillterlist.length,
        // query == "" ?   list.length : fillterlist.length ,    
       itemBuilder: (context , i) {
      
        return  
   
           ListTile(
            leading: Icon(Icons.arrow_forward_ios_outlined),
            title: Text("${fillterlist[i]}"),
            onTap: () {
          
            // query = query == "" ?   names[i] : fillternames[i];
          
            // squery = query == "" ?   list[i] : fillterlist[i];
          
            showResults(context);
          }
          
                     
          
        //    Container(
        //     padding: EdgeInsets.all(10),
        //     child: 
        //     // query==""? Text("${names[i]}") :   Text("${fillternames[i]}"),

        //     query==""? Container(
        //        padding: EdgeInsets.all(10),
        //       child: Text("${list[i]}")) :   Container(
        //          padding: EdgeInsets.all(10),
        //         child: Text("${fillterlist[i]}")),
         
        //  ),
        );
      
       }, 
     );
                 
  


  }
  
}













/* Search from DB Data


// class  Search extends SearchDelegate {
 
//    List <dynamic> list  ;

//    Search({
//     required this.list
//    });
   

//     Future getData1() async {
//     var url = Uri.parse('http://192.168.43.128:8081/Project1/SearchData.php');
//     var data = {"SearchInquiry" : query};
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
//        future: getData1(),
//        builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//             itemCount: snapshot.data.length,
//             itemBuilder: (BuildContext context, i) {
//               return  InquiryList(
//              Inquiry:  snapshot.data[i]['Inquiry'],
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
    
        
//       var fillterlist = query.isEmpty ? list : list.where((element) => element.contains(query)).toList();
//             // ((element) => Element.startwith(query)).toList() ;

//     return  ListView.builder(
//        itemCount: fillterlist.length,
//        itemBuilder: (context , i) {
//         return  
//            ListTile(
//             leading: Icon(Icons.arrow_forward_ios_outlined),
//             title: Text("${fillterlist[i]}"),
//             onTap: () {
//              query = query == "" ?   list[i] : fillterlist[i];
//             showResults(context);
//           }
          
                    
//         );
      
//        }, 
//      );
                 
  


//   }
  
// }

*/