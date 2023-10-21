// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class counter extends StatelessWidget {
  final int alltasks;
  final int allcomplet;
  const counter({super.key, required this.allcomplet, required this.alltasks});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        "$allcomplet/$alltasks",
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: allcomplet ==  alltasks ? Colors.green : Colors.white, //  قاعدة ايف المختصرة
            
            ),
      ),
    );
  }
}
