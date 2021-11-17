import 'package:flutter/material.dart';
import '../../Controller/controllerList.dart';
import '../../Models/Database/noSqlList.dart';
import '../../Models/Pojo/list.dart';
import '../../Models/Widgets/deleteConfirmDialog.dart';
import '../../Models/Widgets/dialogGroupList.dart';

class DropDownListMenu extends StatelessWidget {
  final Liste list;

  const DropDownListMenu({ 
    Key? key, 
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Icon(
        Icons.more_vert,
      ),

      itemBuilder: (context) => [
        PopupMenuItem(
          child: editList(context),
        ),
        PopupMenuItem(
          child: deleteList(context)
        )
      ]
    );
  }

  Widget deleteList(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await showDialog(
          context: context, 
          builder: (BuildContext context) {
            return DeleteConfirmationDialog(
              deleteThing: 'the whole list and its content', 
              deleteConfirmation: () {
                NoSqlList().delete(list);
                Navigator.pop(context);
              }
            );
          }
        );
        Navigator.pop(context);
      }, 
      child: Text('Delete the whole list')
    );
  }

  Widget editList(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await showDialog(
          context: context, 
          builder: (BuildContext context) {
            initializeEditList(list);
            return DialogGroupList(
              title: 'Edit the list title', 
              actionToDo: 'Edit', 
              input: inputListTitle, 
              setData: () {
                editDataList(context, list);
              }
            );
          }
        );
        Navigator.pop(context);
      }, 
      child: Text('Edit the list title')
    );
  }
}
