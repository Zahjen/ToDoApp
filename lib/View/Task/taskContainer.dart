import 'package:flutter/material.dart';
import 'package:my_agenda/Models/Database/noSqlTask.dart';
import 'package:my_agenda/Models/Pojo/task.dart';
import 'package:my_agenda/Models/Style/someStyle.dart';
import 'package:my_agenda/Models/Utils/utils.dart';

class TaskContainer extends StatelessWidget {
  final Task task;
  
  const TaskContainer({ 
    Key? key, 
    required this.task 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingContainerCard,
      decoration: containerBox,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.getTitle()),
                SizedBox(
                  height: 3,
                ),
                Text(
                  task.getDescription(),
                  style: taskDescriptionStyle,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  Utils.getDate(task.getDeadline()),
                  style: taskDeadlineStyle,
                )
              ],
            )
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: (){
                  NoSqlTask().updateState(task);
                }, 
                icon: (task.getState() == true) ?
                  Icon(
                    Icons.circle
                  ) : 
                  Icon(
                    Icons.circle_outlined
                  )
              )
            )
          )  
        ],
      )
    );
  }
}
