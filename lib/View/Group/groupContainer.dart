import 'package:flutter/material.dart';
import 'package:my_agenda/Models/Pojo/group.dart';
import 'package:my_agenda/Models/Style/someStyle.dart';
import 'package:my_agenda/Models/Widgets/structurePage.dart';
import 'package:my_agenda/View/List/addList.dart';
import 'package:my_agenda/View/List/listContainer.dart';

class GroupContainer extends StatelessWidget {
  final Group group;
  
  const GroupContainer({ 
    Key? key, 
    required this.group
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return StructurePage(
              children: [
                AddList(group: group),
                SizedBox(
                  height: 20.0,
                ),
                ListContainer(group: group)
              ]
            );
          })
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15.0),
        decoration: containerBox,
        child: Center(
          child: Text(
            group.getTitle(),
            style: fontSize18,
          ),
        ),
      )
    );
  }
}