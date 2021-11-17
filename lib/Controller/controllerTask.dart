import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../Models/Database/noSqlTask.dart';
import '../Models/Pojo/list.dart';
import '../Models/Pojo/task.dart';

TextEditingController inputTaskTitle = new TextEditingController();
TextEditingController inputTaskDescription = new TextEditingController();
bool state = false;
DateTime deadline = DateTime.now();

SlidableController slidableController = new SlidableController();

void setDataTask(BuildContext context, Liste list) {
  Task task = new Task(
    '1', 
    inputTaskTitle.text, 
    inputTaskDescription.text, 
    deadline, 
    state, 
    list.getId()
  );

  NoSqlTask().create(task);
  Navigator.pop(context);
}

void editDataTask(BuildContext context, Task taskParam) { 
  Task task = new Task(
    taskParam.getId(), 
    inputTaskTitle.text, 
    inputTaskDescription.text, 
    deadline, 
    state, 
    taskParam.getIdList()
  );

  NoSqlTask().update(task);
  Navigator.pop(context);
}

void initializeAddTask() {
  inputTaskTitle.text = "";
  inputTaskDescription.text = "";
  deadline = DateTime.now();
}

void initializeEditTask(Task task) {
  inputTaskTitle.text = task.getTitle();
  inputTaskDescription.text = task.getDescription();
  deadline = task.getDeadline();
}
