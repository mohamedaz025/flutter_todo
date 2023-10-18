// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Todocard extends StatelessWidget {
  const Todocard({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(20),
          color: Colors.grey,
        ),
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "data",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            Icon(
              Icons.close,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
