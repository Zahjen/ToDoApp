import 'package:flutter/cupertino.dart';
import 'package:my_agenda/Models/Database/noSqlList.dart';
import 'package:my_agenda/Models/Pojo/group.dart';
import 'package:my_agenda/Models/Pojo/list.dart';

TextEditingController inputListTitle = new TextEditingController();

void setDataList(BuildContext context, Group group) {
  Liste list = new Liste(
    '1',
    inputListTitle.text,
    group.getId()
  );

  NoSqlList().insert(list);
  Navigator.pop(context);
}

void editDataList(BuildContext context, Liste listParam) {
  Liste list = Liste(
    listParam.getId(), 
    inputListTitle.text,
    listParam.getIdGroup()
  );

  NoSqlList().update(list);
  Navigator.pop(context);
}

void initializeEditList(Liste list) {
  inputListTitle.text = list.getTitle();
}

void initializeAddList() {
  inputListTitle.clear();
}