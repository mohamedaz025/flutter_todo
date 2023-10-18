// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/to_do.dart';            // أساس الكود                                                               
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Todoapp(),
    );
  }
}



class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


     backgroundColor: Color.fromRGBO(58, 66, 86, 0.9),

     appBar: AppBar(
      title: Text("To Do",style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28,color: Colors.white),),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(58, 66, 87, 0.9),
     ),


      body:
      
      Container(
        
        width: double.infinity,
        child: Column(

          children: [
             Todocard(),
             Todocard(),
             Todocard(),
             Todocard(),
             
             
          ],
        ),
      ),
    );
  }
}