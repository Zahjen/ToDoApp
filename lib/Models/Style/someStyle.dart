import 'package:flutter/cupertino.dart';
import 'package:my_agenda/Models/Style/color.dart';

BoxDecoration containerBox = new BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  color: Palette.colorApp[200]
);

TextStyle taskDescriptionStyle = new TextStyle(
  fontSize: 12
);

TextStyle taskDeadlineStyle = new TextStyle(
  fontSize: 12,
  color: Palette.colorApp[300]
);

TextStyle fontSize18 = new TextStyle(
  fontSize: 18
);

TextStyle controlerStyle = new TextStyle(
  color: Palette.colorApp[500]
);

TextStyle errorStyle = new TextStyle(
  color: Palette.colorApp[400],
  fontSize: 12
);

TextStyle listTitleStyle = new TextStyle(
  color: Palette.colorApp,
  fontSize: 16
);

EdgeInsetsGeometry paddingAlertDialog = new EdgeInsets.fromLTRB(25, 25, 25, 7);