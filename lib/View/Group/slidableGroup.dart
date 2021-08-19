import 'package:flutter/material.dart';
import 'package:my_agenda/Controller/controllerGroup.dart';
import 'package:my_agenda/Models/Database/noSqlGroup.dart';
import 'package:my_agenda/Models/Pojo/group.dart';
import 'package:my_agenda/Models/Widgets/deleteConfirmDialog.dart';
import 'package:my_agenda/Models/Widgets/dialogGroupList.dart';
import 'package:my_agenda/Models/Widgets/slidableContainer.dart';
import 'package:my_agenda/View/Group/groupContainer.dart';

class SlidableGroup extends StatelessWidget {
  const SlidableGroup({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Group>>(
      stream: NoSqlGroup().getAll(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Text('Loading');
        }
        if (!snap.hasData) {
          return Text("Query error");
        }
        if (snap.data!.isEmpty) {
          return Text("No group here yet !");
        }

        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: snap.data?.length,
            itemBuilder: (BuildContext context, int index) {
              
              Group group = snap.data![index];

              return SlidableContainer(
                child: GroupContainer(group: group), 
                controller: slidableController, 
                builderEdit: (BuildContext context) {
                  initializeEditGroup(group);
                  return DialogGroupList(
                    title: 'Edit the group title', 
                    actionToDo: 'Edit', 
                    input: inputGroupTitle, 
                    setData: () {
                      editDataGroup(context, group);
                    }
                  );
                }, 
                builderDelete: (BuildContext context) {
                  return DeleteConfirmationDialog(
                    objectType: 'group', 
                    deleteConfirmation: () {
                      NoSqlGroup().delete(group);
                      Navigator.pop(context);
                    }
                  );
                }
              );
            }
          ),
        );
      },
    );
  }
}