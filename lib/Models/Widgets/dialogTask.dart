import 'package:flutter/material.dart';
import 'package:my_agenda/Controller/controllerTask.dart';
import 'package:my_agenda/Models/Style/someStyle.dart';
import 'package:my_agenda/Models/Utils/exception.dart';
import 'package:my_agenda/Models/Utils/utils.dart';

class DialogTask extends StatefulWidget {
  final String actionToDo;
  final VoidCallback setData;

  const DialogTask({ 
    Key? key, 
    required this.actionToDo,
    required this.setData
  }) : super(key: key);

  @override
  _DialogTaskState createState() => _DialogTaskState();
}

class _DialogTaskState extends State<DialogTask> {
  String errorHandleTitle = '';
  String errorHandleDescription = '';

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: deadline,
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null && pickedDate != deadline) {
      setState(() {
        deadline = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: paddingAlertDialog,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          taskSetPoint('${widget.actionToDo} the task'),
          taskInput(inputTaskTitle),
          SizedBox(
            height: 8.0,
          ),
          Text(
            errorHandleTitle,
            style: errorStyle,
          ),
          SizedBox(
            height: 12.0,
          ),
          taskSetPoint('Describe the task'),
          taskInput(inputTaskDescription),
          SizedBox(
            height: 8.0,
          ),
          Text(
            errorHandleDescription,
            style: errorStyle,
          ),
          SizedBox(
            height: 12.0,
          ),
          taskSetPoint('Select a deadline'),
          datePicker(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              cancelButton(context),
              addEditButton(context)
            ],
          )
        ],
      ),
    );
  }

  Widget taskSetPoint(String taskString) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        taskString,
        style: fontSize18,
      ),
    );
  }

  Widget taskInput(TextEditingController taskController) {
    return TextFormField(
      controller: taskController,
      style: controlerStyle,
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      minLines: 1,
      maxLines: 3,
    );
  }

  Widget datePicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(Utils.getDate(deadline)),
        IconButton(
          onPressed: () {
            selectDate(context);
          }, 
          icon: Icon(
            Icons.edit
          ),
        )
      ],
    );
  }

  Widget cancelButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      }, 
      child: Text('Cancel')
    );
  }

  Widget addEditButton(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          errorHandleTitle = '';
          errorHandleDescription = '';
          try {
            widget.setData();
          }
          catch(error) {
            setState(() {
              if (error.toString() == PersonalizedException().taskTitle()) {
                errorHandleTitle = error.toString();
              }
              else if (error.toString() == PersonalizedException().taskDescripion()) {
                errorHandleDescription = error.toString();
              }
            }); 
          }
        }, 
        child: Text('${widget.actionToDo}')
      )
    );
  }
}
