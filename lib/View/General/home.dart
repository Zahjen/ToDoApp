import 'package:flutter/material.dart';
import 'package:my_agenda/Models/Style/theme.dart';
import 'package:my_agenda/Models/Widgets/structurePage.dart';
import 'package:my_agenda/View/Group/addGroup.dart';
import 'package:my_agenda/View/Group/slidableGroup.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Agenda',
      theme: themeGeneral,
      home: StructurePage(
        children: [
          AddGroup(),
          SizedBox(           
            height: 20.0,
          ),
          SlidableGroup()
        ],
      ),
    );
  }
}