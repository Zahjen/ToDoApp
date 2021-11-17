import 'package:flutter/material.dart';
import '../../Models/Database/noSqlList.dart';
import '../../Models/Pojo/group.dart';
import '../../Models/Pojo/list.dart';
import '../../Models/Style/someStyle.dart';
import '../../View/Task/todaySlidableTask.dart';

class TodayList extends StatefulWidget {
  final Group group;

  const TodayList({Key? key, required this.group}) : super(key: key);

  @override
  State<TodayList> createState() => _TodayListState();
}

class _TodayListState extends State<TodayList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder<List<Liste>>(
      stream: NoSqlList().getAllByGroup(widget.group),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }
        if (!snap.hasData) {
          return Text("Query error");
        }
        if (snap.data!.isEmpty) {
          return Text("No list here yet!");
        }

        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: snap.data?.length,
            itemBuilder: (BuildContext context, int index) {
              
              Liste list = snap.data![index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    list.getTitle(),
                    style: listTitleStyle,
                  ),
                  TodaySlidableTask(list: list),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              );
            }
          )
        );
      }
    );
  }

  @override
  bool get wantKeepAlive => true;
}
