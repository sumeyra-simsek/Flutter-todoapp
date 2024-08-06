import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, required this.addNewTask});

  final void Function(Task newTask) addNewTask;

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Tasktype tasktype = Tasktype.note;

  @override
  Widget build(BuildContext context) {
    double deviceHeight =
        MediaQuery.of(context).size.height; //telefon yuksekligi
    double deviceWidth = MediaQuery.of(context).size.width; // genisligi
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: HexColor(backgroundColor),
            //HexColor(backgroundColor),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: deviceWidth,
                    height: deviceHeight / 6.5,
                    color: Colors.deepPurple,
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 27,
                                color: Colors.white,
                              )),
                          const Expanded(
                            child: const Text(
                              "Add New Task",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ])),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 20, right: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Task Title",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                              hintText: "Task title",
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Category",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                              Builder(
                                  builder: (context) => GestureDetector(
                                        onTap: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              content:
                                                  Text("Category Selected."),
                                            ),
                                          );
                                          setState(() {
                                            tasktype = Tasktype.note;
                                          });

                                        },
                                        child: Image.asset(
                                            "lib/assets/images/Category.png"),
                                      )),
                              Builder(
                                  builder: (context) => GestureDetector(
                                        onTap: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              content:
                                                  Text("Category Selected."),
                                            ),
                                          );
                                          setState(() {
                                            tasktype = Tasktype.calender;
                                          });
                                        },
                                        child: Image.asset(
                                            "lib/assets/images/Category2.png"),
                                      )),
                              Builder(
                                  builder: (context) => GestureDetector(
                                        onTap: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              content:
                                                  Text("Category Selected."),
                                            ),
                                          );
                                          setState(() {
                                            tasktype = Tasktype.contest;
                                          });
                                        },
                                        child: Image.asset(
                                            "lib/assets/images/Category3.png"),
                                      )),
                            ],
                          )),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Date",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: deviceWidth / 2.7),
                            child: Text("Time",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: SizedBox(
                                width: deviceWidth / 2.5,
                                child: TextField(
                                  controller: dateController,
                                  decoration: InputDecoration(
                                      hintText: "Date",
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor: Colors.white),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: SizedBox(
                                width: deviceWidth / 2.5,
                                child: TextField(
                                  controller: timeController,
                                  decoration: InputDecoration(
                                      hintText: "Time",
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor: Colors.white),
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10, left: 20, right: 10, bottom: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Description",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15))),
                      ),
                      SizedBox(
                        height: 140,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: descriptionController,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                  isDense: true,
                                  hintText: "Description",
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Colors.white),
                              expands: true,
                              maxLines: null,
                            )),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Task newtask = Task(
                              type: tasktype,
                              title: titleController.text,
                              description: descriptionController.text,
                              isCompleted: false);
                          widget.addNewTask(newtask); // task constructor ile yeni bir newtask olusturduk ve bunu bu bir fonksyona ekledik.
                        }, // bu fonksiyon bir ust sayfa olan homedartta olusturuldu.
                        child: Text("Save",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          // Arka plan rengi
                          foregroundColor: Colors.white,
                          // Metin rengi
                          shadowColor: Colors.black,
                          // Gölge rengi
                          elevation: 5,
                          // Gölge yüksekliği
                          shape: RoundedRectangleBorder(
                            // Buton şekli
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 62, vertical: 10), // İç boşluklar
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
