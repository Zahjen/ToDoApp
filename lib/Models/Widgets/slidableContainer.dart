import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableContainer extends StatelessWidget {
  final Widget child;
  final SlidableController controller;
  final Widget Function(BuildContext) builderEdit;
  final Widget Function(BuildContext) builderDelete;

  const SlidableContainer({ 
    Key? key,
    required this.child,
    required this.controller,
    required this.builderEdit,
    required this.builderDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        Slidable(
          controller: controller,
          actionExtentRatio: 0.15,
          actionPane: SlidableDrawerActionPane(),
          secondaryActions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context, 
                  builder: builderEdit
                );
                controller.activeState?.close();
              }, 
              icon: Icon(
                Icons.edit
              )
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context, 
                  builder: builderDelete
                );
                controller.activeState?.close();
              },
              icon: Icon(
                Icons.delete
              )
            )
          ],
          child:child
        )
      ],
    );
  }
}