// ignore_for_file: file_names, prefer_const_constructors

import 'package:Tasawe7/compnent/SpinningCircler.dart';
import 'package:flutter/material.dart';

import '../compnent/Bar.dart';
import 'components/anytoAny.dart';
import 'components/usdToAny.dart';
import 'functions/fetchrates.dart';
import 'models/ratesmodel.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {

  late Future<RatesModel> result;
  late Future<Map> allcurrencies;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    setState(() {
      result = fetchrates();
      allcurrencies = fetchCurrencies();
    });

  }

  @override
  Widget build(BuildContext context) {
   var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Bar3(
              title: "العملة",
              child:
        //Future Builder for Getting Exchange Rates
        Padding(
          padding: const EdgeInsets.only(top:5),
          child: Container(
            height: h,
            width: w,
            padding: EdgeInsets.all(20),
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage('assets/currency.jpeg'),
            //         fit: BoxFit.cover)),
            child: Center(
              child: SingleChildScrollView(
                 physics:  BouncingScrollPhysics(
                 parent: AlwaysScrollableScrollPhysics()),
                child: Form(
                  key: formkey,
                  child: FutureBuilder<RatesModel>(
                    future: result,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SpinningCircler();
                      }
                      return Center(
                        child: FutureBuilder<Map>(
                            future: allcurrencies,
                            builder: (context, currSnapshot) {
                              if (currSnapshot.connectionState == ConnectionState.waiting) {
                                return SpinningCircler();
                              }
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  UsdToAny(
                                    currencies: currSnapshot.data!,
                                    rates: snapshot.data!.rates,
                                  ),
                                  AnyToAny(
                                    currencies: currSnapshot.data!,
                                    rates: snapshot.data!.rates,
                                  ),
                                ],
                              );
                            }),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
