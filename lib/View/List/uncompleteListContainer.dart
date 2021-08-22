import 'package:flutter/material.dart';
import 'package:my_agenda/Controller/controllerTask.dart';
import 'package:my_agenda/Models/Database/noSqlList.dart';
import 'package:my_agenda/Models/Pojo/group.dart';
import 'package:my_agenda/Models/Pojo/list.dart';
import 'package:my_agenda/Models/Style/someStyle.dart';
import 'package:my_agenda/Models/Widgets/dialogTask.dart';
import 'package:my_agenda/View/List/dropDownListMenu.dart';
import 'package:my_agenda/View/Task/uncompleteSlidableTask.dart';

class UncompleteListContainer extends StatelessWidget {
  final Group group;
  
  const UncompleteListContainer({ 
    Key? key,
    required this.group
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Liste>>(
      stream: NoSqlList().getAllByGroup(group),
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
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.add
                            ),
                            onPressed: () {
                              initializeAddTask();
                              showDialog(
                                context: context, 
                                builder: (BuildContext context) {
                                  return DialogTask(
                                    actionToDo: 'Add', 
                                    setData: () {
                                      setDataTask(context, list);
                                    }
                                  );
                                }
                              );
                            },
                          ),
                          DropDownListMenu(list: list)
                        ],
                      ),
                    ],
                  ),
                  UncompleteSlidableTask(list: list),
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