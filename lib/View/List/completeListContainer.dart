import 'package:flutter/material.dart';
import 'package:my_agenda/Models/Database/noSqlList.dart';
import 'package:my_agenda/Models/Pojo/group.dart';
import 'package:my_agenda/Models/Pojo/list.dart';
import 'package:my_agenda/Models/Style/someStyle.dart';
import 'package:my_agenda/Models/Widgets/deleteConfirmDialog.dart';
import 'package:my_agenda/View/Task/completeSlidableTask.dart';

class CompleteListContainer extends StatefulWidget {
  final Group group;
  
  const CompleteListContainer({ 
    Key? key,
    required this.group
  }) : super(key: key);

  @override
  _CompleteListContainerState createState() => _CompleteListContainerState();
}

class _CompleteListContainerState extends State<CompleteListContainer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Liste>>(
      stream: NoSqlList().getAllByGroup(widget.group),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }
        if (!snap.hasData) {
          return Text("Query error");
        }
        if (snap.data!.isEmpty) {
          return Text("No list here yet!");
        }

        return Expanded( 
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: snap.data?.length,
            itemBuilder: (BuildContext context, int index) {
              
              Liste list = snap.data![index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        list.getTitle(),
                        style: listTitleStyle,
                      ),
                      IconButton(
                        onPressed: () async {
                          await showDialog(
                            context: context, 
                            builder: (BuildContext context) {
                              return DeleteConfirmationDialog(
                                deleteThing: 'all completed task', 
                                deleteConfirmation: () {
                                  NoSqlList().deleteAllCompleteTask(list);
                                  Navigator.pop(context);
                                }
                              );
                            }
                          );                          
                        }, 
                        icon: Icon(
                          Icons.delete_forever
                        )
                      ),
                    ],
                  ),
                  CompleteSlidableTask(list: list),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              );
            }
          )
        );
      }
    );
  }
}

