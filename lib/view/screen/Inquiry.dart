// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names, unused_local_variable, library_prefixes, avoid_print

import 'dart:convert';

import 'package:Tasawe7/controller/auth/inquiryController.dart';
import 'package:Tasawe7/controller/core/class/handlingDataView.dart';
import 'package:Tasawe7/view/widget/compnent/HomePageCard.dart';
import 'package:Tasawe7/view/widget/compnent/InquiryDetails.dart';
import 'package:Tasawe7/view/widget/compnent/SpinningCircler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Tasawe7/view/widget/compnent/Bar.dart';
import 'package:Tasawe7/view/widget/compnent/InquiryList.dart';
import 'package:Tasawe7/controller/core/constants/color.dart' ;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
 import 'package:Tasawe7/controller/core/constants/api.dart' ;

class Inquiry extends StatefulWidget {
  const Inquiry({Key? key}) : super(key: key);

  @override
  State<Inquiry> createState() => _InquiryState();
}

class _InquiryState extends State<Inquiry> {


  List<dynamic> listsearch = [];

  Future getData() async {
    var url = Uri.parse(Api.search);
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    for (int i = 0; i < responsebody.length; i++) {
      listsearch.add(responsebody[i]['Inquiry']);
    }
    print(listsearch);
    return responsebody;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeigh = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Get.put(InquiryController());

    return Bar(
      title: "ارشادات خدمات المواطنين",
      action: IconButton(
          // padding: EdgeInsets.all(15),
          onPressed: (() {
            showSearch(context: context, delegate: Search(list: listsearch));
          }),
          icon: Icon(Icons.search_rounded,
              color: isDark ? AppColor.ColorTextB : AppColor.ColorText)),

      child:
            GetBuilder<InquiryController>(
            builder: (controller) {
            return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 1,
                crossAxisCount: 2,
              ),
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                var item = controller.data[index];
                return HomePageCard1(
                  color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
                  context: context,
                  route: () {
                    HapticFeedback.lightImpact();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return InquiryDetails(
                          Inquiry: item['Inquiry'],
                          Details: item['Details'],
                        );
                      },
                    ));
                  },
                  title: "${item['Inquiry']}",
                );
              },
            ),
          );
        },
      ),
    );
  }
}



class Search extends SearchDelegate {
  List<dynamic> list;

  Search({
    required this.list,
  });

  Future getSearchData() async {
    var url = Uri.parse(Api.searchData);
    var data = {"SearchInquiry": query};
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return [
             IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(CupertinoIcons.forward, size: 30, color: isDark ? Color.fromARGB(255, 255, 255, 255) : Colors.black,),
    )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return    
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close_sharp, color: isDark ? Color.fromARGB(255, 255, 255, 255) : Colors.black,),
      );  
    

  }

  @override
  Widget buildResults(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return 
    Directionality(textDirection: TextDirection.rtl,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark ? AppColor.ColorBackGroundB : AppColor.ColorBackGround,
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColor.ColorConShadow,
              blurRadius: 10,
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.only(top: 120),
          child: FutureBuilder(
            future: getSearchData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return InquiryList(
                      Inquiry: snapshot.data[i]['Inquiry'],
                      Details: snapshot.data[i]['Details'],
                    );
                  },
                );
              }
              return Center(child: SpinningCircler());
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchlist = query.isEmpty
        ? list
        : list.where((element) => element.toLowerCase().contains(query)).toList();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Directionality(textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark ? AppColor.ColorBackGroundB : AppColor.ColorBackGround,
          ),
        ),
        child: ListView.builder(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: searchlist.length,
          itemBuilder: (context, i) {
            return Container(
              height: 50,
              margin: EdgeInsets.only(top: 15, right: 15, left: 15),
              padding: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColor.ColorAppBar,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: AppColor.ColorConShadow,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Material(
                  color: const Color.fromARGB(0, 64, 233, 255),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    highlightColor: const Color.fromARGB(255, 36, 156, 254),
                    splashColor: const Color.fromARGB(255, 36, 156, 254),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward_ios_outlined,
                          color: isDark ? Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 255, 255, 255),),
                          SizedBox(width: 10,),
                        Text("${searchlist[i]}",
                          style: TextStyle(color: isDark ? Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 255, 255, 255),)),
                      ],
                    ),
                    onTap: () {
                      query = query == "" ? searchlist[i] : searchlist[i];
                      showResults(context);
                    },
                  ),
                ),
            );
          },
        ),
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ThemeData(
      hintColor: Colors.white,
      primaryColor: Color.fromRGBO(43, 49, 79, 1),
      appBarTheme: AppBarTheme(
        titleSpacing: 1,
        toolbarHeight: 100,
        color: isDark ? Color.fromRGBO(43, 49, 79, 1) : Colors.white,
      ),
      fontFamily: "ElMessiri",
      inputDecorationTheme: InputDecorationTheme(
        helperStyle: TextStyle(color: isDark ? Color.fromARGB(255, 255, 255, 255) : Colors.black),
        fillColor: isDark ? Color(0xFF59CAEF) : Color(0xFF59CAEF),
        filled: true,
        counterStyle: TextStyle(color: isDark ? Color.fromARGB(255, 255, 255, 255) : Colors.black),
        hintStyle: TextStyle(color: isDark ? Color.fromARGB(255, 0, 0, 0) : Colors.black),
        labelStyle: TextStyle(color: isDark ? Color.fromARGB(255, 255, 255, 255) : Colors.black),
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color(0xff2F3D75), width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color(0xff2F3D75), width: 2.0),
        ),
      ),
    );
  }
}
