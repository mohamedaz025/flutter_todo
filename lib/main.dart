// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
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
    Task(title: "gem", status: false),
    Task(title: "pulish", status: true),
  ];

  addnew() {
    setState(() {

      alltask.add(    //  لعمل اضافة داخل ليست 
        Task(title: myController.text, status: true),   // جعل لالتيتيل يساوي المتغير
        
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //
        onPressed: () {
          showModalBottomSheet(
              //   لعمل صفحة تفتح للمنتصف
              context: context,
              builder: (BuildContext context) {
                return Container(
                    padding: EdgeInsets.all(25),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: myController,  // ربط التيكست بمتغير
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
                    ));
              },
              isScrollControlled: true // لجعل القائمة تظهر بالكامل الصفحة

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
            // Todocard(),
            ...alltask
                .map((item) => Todocard(
                      //  وضع الليست داخل ماب
                      vartitle: item.title, //  تغير المتغير في التيكست بالليست
                      donORnot: item.status,
                    ))
                .toList() //  تكرار بعدد المدخلات داخل الليسته
          ],
        ),
      ),
    );
  }
}
