import 'package:flutter/material.dart';
import '../../Models/Pojo/group.dart';
import '../../Models/Style/someStyle.dart';
import '../../View/General/listBody.dart';

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
          MaterialPageRoute(
            builder: (context) {
              return ListBodyPart(group: group);
            }
          )
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: paddingContainerCard,
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
