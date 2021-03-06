import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../Models/Database/noSqlGroup.dart';
import '../Models/Pojo/group.dart';

TextEditingController inputGroupTitle = new TextEditingController();

SlidableController slidableController = new SlidableController();

void setDataGroup(BuildContext context) {
  Group group = new Group(
    '1',
    inputGroupTitle.text
  );

  NoSqlGroup().create(group);
  Navigator.pop(context);
}

void editDataGroup(BuildContext context, Group groupParam) {
  Group group = new Group(
    groupParam.getId(), 
    inputGroupTitle.text
  );

  NoSqlGroup().update(group);
  Navigator.pop(context);
}

void initializeAddGroup() {
  inputGroupTitle.text = "";
}

void initializeEditGroup(Group group) {
  inputGroupTitle.text = group.getTitle();
}
