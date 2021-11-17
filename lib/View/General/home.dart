import 'package:flutter/material.dart';
import '../../Models/Style/theme.dart';
import '../../Models/Widgets/structurePage.dart';
import '../../View/Group/addGroup.dart';
import '../../View/Group/slidableGroup.dart';

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
