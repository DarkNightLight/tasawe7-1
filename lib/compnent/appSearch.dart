// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
class TEEst extends StatefulWidget {
  

  @override
  State<TEEst> createState() => _TEEstState();
}

class _TEEstState extends State<TEEst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: InkWell(onTap: () {
        
      },
        child: Container()
        ),
    );
  }
}



