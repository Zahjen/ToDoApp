import 'package:flutter/material.dart';
import 'package:my_agenda/Models/Database/noSqlTask.dart';
import 'package:my_agenda/Models/Pojo/list.dart';
import 'package:my_agenda/Models/Pojo/task.dart';
import 'package:my_agenda/Models/Widgets/deleteConfirmDialog.dart';
import 'package:my_agenda/Models/Widgets/dialogTask.dart';
import 'package:my_agenda/Models/Widgets/slidableContainer.dart';
import 'package:my_agenda/View/Task/taskContainer.dart';
import 'package:my_agenda/Controller/controllerTask.dart';

class TodaySlidableTask extends StatelessWidget {
  final Liste list;

  const TodaySlidableTask({ 
    Key? key, 
    required this.list 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Task>>(
      stream: NoSqlTask().getAllForToday(list),
      builder: (BuildContext context, AsyncSnapshot<List<Task>> snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }
        if (!snap.hasData) {
          return Text("Query error");
        }
        if (snap.data!.isEmpty) {
          return Text("No task here yet!");
        }

        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: snap.data?.length,
          itemBuilder: (BuildContext context, int index) {
      
            Task task = snap.data![index];

            return SlidableContainer(
              child: TaskContainer(task: task), 
              controller: slidableController, 
              builderEdit: (BuildContext context) {
                initializeEditTask(task);
                return DialogTask(
                  actionToDo: 'Edit', 
                  setData: () {
                    editDataTask(context, task);
                  }
                );
              }, 
              builderDelete: (BuildContext context) {
                return DeleteConfirmationDialog(
                  deleteThing: 'this task', 
                  deleteConfirmation: () {
                    NoSqlTask().delete(task);
                    Navigator.pop(context);
                  }
                );
              }
            );
          }
        );
      }
    );
  }
}

