import 'package:flutter/material.dart';
import '../../Controller/controllerGroup.dart';
import '../../Models/Style/someStyle.dart';
import '../../Models/Utils/utils.dart';
import '../../Models/Widgets/dialogGroupList.dart';

class AddGroup extends StatelessWidget {
  const AddGroup({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime todayDate = new DateTime.now();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Utils.getDate(todayDate),
          style: fontSize18,
        ),
        IconButton(
          onPressed: () {
            initializeAddGroup();
            showDialog(
              context: context, 
              builder: (BuildContext context) {
                return DialogGroupList(
                  title: 'Name the group', 
                  actionToDo: 'Add', 
                  input: inputGroupTitle, 
                  setData: () {
                    setDataGroup(context);
                  }
                );
              }
            );
          }, 
          icon: Icon(
            Icons.add
          )
        )
      ],
    );
  }
}
