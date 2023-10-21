// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/counter.dart';
import 'package:flutter_todo/widgets/to_do.dart'; // أساس الكود

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

class Task {
  //   ليسته مدخلات الثابته
  String title;
  bool status; //  نوع المتغير ترو او فولس
  Task({
    required this.title,
    required this.status,
  });
}

class _TodoappState extends State<Todoapp> {
  final myController =
      TextEditingController(); //  لعمل كونكت مع التيكست فيلد والتخزين داخل متغير
  
  List alltask = [
    //  ليسته بالتسكات
    Task(title: "pulish video", status: true),
    Task(title: "pulish ", status: true),
    Task(title: "gem", status: true),
    Task(title: "pulish", status: true),
  ];

  addnew() {
    setState(() {
      alltask.add(
        //  لعمل اضافة داخل ليست
        Task(
            title: myController.text,
            status: false), // جعل لالتيتيل يساوي المتغير
      );
    });
  }

  int calc() {
    int complet = 0;
    alltask.forEach((item) {
      if (item.status) {
        complet++;
      }
    });
    return complet;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //
        onPressed: () {
          showDialog(
            //   لعمل صفحة تفتح للمنتصف
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                    padding: EdgeInsets.all(25),
                    width: double.infinity,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: myController, // ربط التيكست بمتغير
                          maxLength: 20, //  لعمل حد اقصي للمدخل
                          decoration: InputDecoration(hintText: "Add new task"),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                            onPressed: () {
                              addnew();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(fontSize: 25),
                            ))
                      ],
                    )),
              );
            },
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.9),
      appBar: AppBar(
        title: Text(
          "To Do",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 28, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(58, 66, 87, 0.9),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            counter(
              alltasks: alltask.length,
              allcomplet: calc(),
            ),
            Container(
              color: Colors.blue,
              margin: EdgeInsets.only(top: 20),
              height: 630,
              child: ListView.builder(
                  itemCount: alltask.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Todocard(
 
                      vartitle: alltask[index].title, 
                      donORnot: alltask[index].status,
                    );
                  }),
            )
            // Todocard(),
          ],
        ),
      ),
    );
  }
}
