import 'package:flutter/material.dart';
import 'package:my_agenda/Models/Style/someStyle.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final String deleteThing;
  final void Function()? deleteConfirmation;

  const DeleteConfirmationDialog({ 
    Key? key,
    required this.deleteThing,
    required this.deleteConfirmation
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: paddingAlertDialog,
      title: Text('Delete'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Do you want to delete $deleteThing ?'),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              cancelBtn(context),
              confirmBtn(context),
            ],
          )
        ],
      )
    );
  }

  Widget cancelBtn(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      }, 
      child: Text('Cancel')
    );
  }

  Widget confirmBtn(BuildContext context) {
    return TextButton(
      onPressed: deleteConfirmation, 
      child: Text('Confirm')
    );
  }
}
