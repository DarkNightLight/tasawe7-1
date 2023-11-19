// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../currency/models/GoldModel.dart';



// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home:  GoldPrice(),
//     );
//   }
// }

// class GoldPrice extends StatefulWidget {
//   late  String title;


//   @override
//   _GoldPriceState createState() => _GoldPriceState();
// }

// class _GoldPriceState extends State<GoldPrice> {
//   final StreamController<List<GoldModel>> goldStream =
//       StreamController<List<GoldModel>>();

//   @override
//   void initState() {
//     super.initState();
//     getDataGold();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     goldStream.close();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: StreamBuilder<List<GoldModel>>(
//         stream: goldStream.stream,
//         builder: (context, asyncSnapshot) {
//           if (!asyncSnapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           final goldData = asyncSnapshot.data;
//           return ListView.separated(
//             itemCount: goldData!.length,
//             itemBuilder: (context, index) =>
//                 _builderGoldInfoRowData(goldData[index], index),
//             separatorBuilder: (BuildContext context, int index) => Container(
//               height: 2,
//               color: const Color(0xffCC9900),
//             ),
//           );
//         },
//       ),
//     );
//   }



//     //   var data = {  "content" : _content.text };
//     //   var url = Uri.parse("http://192.168.43.128:8081/Tasawe7/Suggestions.php");
//     //   var response = await http.post(url, body: data);
//     //  var responsebody = jsonDecode(response.body);
//     //  if (responsebody['status'] == "success") {




      
//   Future<void> getDataGold() async {
//     final goldData = <GoldModel>[];

//     var url = Uri.parse ("http://sjc.com.vn/giavang/textContent.php");
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       var document = jsonDecode(response.body);
//       var listTr = document.querySelectorAll("tr");
//       for (final trItem in listTr) {
//         try {
//           final listTd = trItem.querySelectorAll("td");
//           final gold = GoldModel(
//             name: listTd[0].text,
//             oldPrice: listTd[1].text,
//             newPrice: listTd[2].text,
//           );
//           goldData.add(gold);
//         } catch (e) {
//           //print(e.message);
//         }
//       }
//     } else {
//       //print("Request failed with status code: ${response.statusCode}");
//     }
//     goldStream.sink.add(goldData);
//   }

//   Widget _builderGoldInfoRowData(goldModel, index) {
//     return Container(
//       color: Color(0xff1a237e),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.only(left: 10, right: 10),
//               child: Text(
//                 goldModel.name,
//                 textAlign: index == 0 ? TextAlign.center : TextAlign.left,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.yellow,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               height: 50,
//               color: index == 0 ? Colors.transparent : Colors.blue,
//               child: Center(
//                 child: Text(
//                   goldModel.oldPrice,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: index == 0 ? Colors.yellow : Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               height: 50,
//               color: index == 0 ? Colors.transparent : Colors.blue,
//               child: Center(
//                 child: Text(
//                   goldModel.newPrice,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: index == 0 ? Colors.yellow : Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
