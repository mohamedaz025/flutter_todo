// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Todocard extends StatelessWidget {
  final String vartitle; //  تعريف متغير
  final bool donORnot;
  final Function myfunc;
  final int index;
  final Function delete;
  const Todocard(
      {super.key,
      required this.vartitle,
      required this.donORnot,
      required this.delete,
      required this.index,
      required this.myfunc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myfunc(index);
      },
      child: FractionallySizedBox(
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
              Row(
                children: [
                  Icon(
                    donORnot ? Icons.check : Icons.close,
                    size: 27,
                    color: donORnot ? Colors.green : Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      delete(index);
                    },
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
