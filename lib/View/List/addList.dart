import 'package:flutter/material.dart';
import 'package:my_agenda/Controller/controllerList.dart';
import 'package:my_agenda/Models/Pojo/group.dart';
import 'package:my_agenda/Models/Style/someStyle.dart';
import 'package:my_agenda/Models/Widgets/dialogGroupList.dart';
import 'package:my_agenda/View/General/home.dart';

class AddList extends StatelessWidget {
  final Group group;

  const AddList({ 
    Key? key, 
    required this.group 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }, 
          icon: Icon(
            Icons.arrow_back
          )
        ),
        Text(
          group.getTitle(),
          style: fontSize18,
        ),
        IconButton(
          onPressed: () {
            initializeAddList();
            showDialog(
              context: context, 
              builder: (BuildContext context) {
                return DialogGroupList(
                  title: "Name the list", 
                  actionToDo: "Add", 
                  input: inputListTitle, 
                  setData: () {
                    setDataList(context, group);
                  }
                );
              }
            );
          }, 
          icon: Icon(
            Icons.add,
          )
        )
      ],
    );
  }
}
