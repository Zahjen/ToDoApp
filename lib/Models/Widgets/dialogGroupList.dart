import 'package:flutter/material.dart';
import 'package:my_agenda/Models/Style/someStyle.dart';

class DialogGroupList extends StatefulWidget {
  final String title;
  final String actionToDo;
  final TextEditingController input;
  final VoidCallback setData;

  const DialogGroupList({ 
    Key? key,
    required this.title,
    required this.actionToDo,
    required this.input,
    required this.setData
  }) : super(key: key);

  @override
  _DialogGroupListState createState() => _DialogGroupListState();
}

class _DialogGroupListState extends State<DialogGroupList> {
  String errorHandle = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: paddingAlertDialog,
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          groupTitle(),
          SizedBox(
            height: 8.0,
          ),
          Text(
            errorHandle,
            style: errorStyle
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              cancelButton(context),
              addEditButton(context),
            ],
          )
        ],
      ),
    );
  }

  Widget groupTitle() {
    return TextFormField(
      controller: widget.input,
      style: controlerStyle
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
    return TextButton(
      onPressed: () {
        try {
          widget.setData();
        }
        catch(error) {
          setState(() {
            errorHandle = error.toString();
          }); 
        }
      }, 
      child: Text(widget.actionToDo)
    );
  }
}