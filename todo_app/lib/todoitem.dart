import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

class todoitem extends StatefulWidget {
  const todoitem({super.key, required this.task});

  final Task task;

  @override
  State<todoitem> createState() => _todoitemState();
}

class _todoitemState extends State<todoitem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isCompleted ? Colors.white30 : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.task.type == Tasktype.note
                ? Image.asset("lib/assets/images/Category.png")
                : widget.task.type == Tasktype.calender
                    ? Image.asset("lib/assets/images/Category2.png")
                    : Image.asset("lib/assets/images/Category3.png"),
            Expanded(
              child: Column(children: [
                Text(
                  widget.task.title,
                  style: TextStyle(
                    decoration: widget.task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(widget.task.description,
                      style: TextStyle(
                        decoration: widget.task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none
                      ))
              ]),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(
                  () {
                    widget.task.isCompleted = ! widget.task.isCompleted;
                    isChecked = val!; //valvarsa!islemesok

                  },
                )
              },
            ),
          ],
        ),
      ),
    );
  }
}
