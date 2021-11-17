import 'package:flutter/material.dart';
import '../../Models/Database/noSqlTask.dart';
import '../../Models/Pojo/list.dart';
import '../../Models/Pojo/task.dart';
import '../../Models/Widgets/deleteConfirmDialog.dart';
import '../../Models/Widgets/dialogTask.dart';
import '../../Models/Widgets/slidableContainer.dart';
import '../../View/Task/taskContainer.dart';
import '../../Controller/controllerTask.dart';

class UncompleteSlidableTask extends StatefulWidget {
  final Liste list;

  const UncompleteSlidableTask({Key? key, required this.list})
      : super(key: key);

  @override
  State<UncompleteSlidableTask> createState() => _UncompleteSlidableTaskState();
}

class _UncompleteSlidableTaskState extends State<UncompleteSlidableTask>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder<List<Task>>(
      stream: NoSqlTask().getAllFalse(widget.list),
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
                    });
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

  @override
  bool get wantKeepAlive => true;
}
