import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/service/todo_service.dart';
import 'package:todo_app/todoitem.dart';
import 'dart:ui';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

//List<String> todo = ["Study Lessons", "Run", "Go to party"];
//List<String> completed = ["Game meeting","take out trash"];

class _homescreenState extends State<homescreen> {
  List<Task> todo = [
    Task(
        type: Tasktype.note,
        title: "Study Lessons",
        description: "description",
        isCompleted: false),
    Task(
        type: Tasktype.calender,
        title: "Go to partyy",
        description: "description",
        isCompleted: false),
    Task(
        type: Tasktype.contest,
        title: "Run 5km",
        description: "description",
        isCompleted: false)
  ];
  List<Task> completed = [
    Task(
        type: Tasktype.calender,
        title: "Go to party",
        description: "description",
        isCompleted: false),
    Task(
        type: Tasktype.contest,
        title: "Run 5km",
        description: "description",
        isCompleted: false)
  ];

  void addNewTask(Task newTask) {
    // tip dondurmeyen fonk task paramtresi alır
    setState(() {
      todo.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();
    double deviceHeight =
        MediaQuery.of(context).size.height; //telefon yuksekligi
    double deviceWidth = MediaQuery.of(context).size.width; // genisligi
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              //Appbar kısmı
              Container(
                // appbar kısmı
                width: deviceWidth,
                height: deviceHeight / 5,
                color: Colors.deepPurple,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("Temmuz-2024",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("My Todo List",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              //ilk colon
              Expanded(
                // ekranı kaplayan widget
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: todo.length,
                      itemBuilder: (context, index) {
                        return todoitem(task: todo[index]);
                      },
                    ),
                  ),
                ),
              ),
              //ara yazı
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Completed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              //ikinci kolon
              Expanded(
                // ekranı kaplayan widget
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: ListView.builder(primary:false,
                        shrinkWrap:true,
                        itemCount:completed.length,
                        itemBuilder:(context,index){
                          return todoitem(task:completed[index]);
                        },
                      )),
                ),
              ),

              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddNewTaskScreen(
                              addNewTask: (newTask) => addNewTask(newTask),
                            )));
                  },
                  child: const Text("Add New Task"),
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
