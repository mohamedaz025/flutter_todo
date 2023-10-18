// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Todocard extends StatelessWidget {
  final String vartitle; //  تعريف متغير
  final bool donORnot;
  const Todocard({super.key, required this.vartitle, required this.donORnot});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(20),
          color: Colors.grey[800],
        ),
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              vartitle, //  ربط التيكست بالمتغير
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Icon(

              
             donORnot ? Icons.check :Icons.close,
             size: 27,
             color: donORnot ? Colors.green :Colors.red,

            )
          ],
        ),
      ),
    );
  }
}
