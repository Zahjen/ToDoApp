import 'package:flutter/material.dart';
import '../../Models/Pojo/group.dart';
import '../../Models/Style/someStyle.dart';
import '../../View/List/addList.dart';
import '../../View/List/completeListContainer.dart';
import '../../View/List/todayList.dart';
import '../../View/List/uncompleteListContainer.dart';

class ListBodyPart extends StatefulWidget {
  final Group group;
  
  const ListBodyPart({ 
    Key? key,
    required this.group
  }) : super(key: key);

  @override
  _ListBodyPartState createState() => _ListBodyPartState();
}

class _ListBodyPartState extends State<ListBodyPart> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> optionPage = [
      UncompleteListContainer(group: widget.group),
      CompleteListContainer(group: widget.group),
      TodayList(group: widget.group)
    ];

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: paddingContainer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddList(group: widget.group),
              SizedBox(
                height: 20.0,
              ),
              optionPage[selectedIndex],
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list
              ),
              label: '',
              tooltip: 'Uncomplete',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.fact_check_outlined
              ),
              label: '',
              tooltip: 'Complete'
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today
              ),
              label: '',
              tooltip: 'Today'
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
      )
    );
  }
}
