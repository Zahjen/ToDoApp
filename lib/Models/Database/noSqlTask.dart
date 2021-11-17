import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Models/Database/noSqlList.dart';
import '../../Models/Pojo/list.dart';
import '../../Models/Pojo/task.dart';

class NoSqlTask {

  CollectionReference groupCollection = FirebaseFirestore.instance.collection('Group');

  Future create(Task task) async {
    Liste list = await NoSqlList().getById(task.getIdList());

    return await groupCollection
      .doc(list.getIdGroup())
      .collection('List')
      .doc(list.getId())
      .collection('Task')
      .add({
        'title': task.getTitle(),
        'description': task.getDescription(),
        'deadline': task.getDeadline(),
        'state': task.getState(),
      });
  }

  Stream<List<Task>> getAllFalse(Liste list) { 
    return groupCollection
      .doc(list.getIdGroup())
      .collection('List')
      .doc(list.getId())
      .collection('Task')
      .orderBy('deadline', descending: false)
      .where('state', isEqualTo: false)
      .snapshots()
      .map((QuerySnapshot snapshot) {
        return snapshot.docs.map((e) {
          return Task(
            e.id, 
            e.get('title'), 
            e.get('description'), 
            DateTime.fromMicrosecondsSinceEpoch(
              e.get('deadline')
              .microsecondsSinceEpoch
            ),
            e.get('state'), 
            list.getId(),
          );
        }).toList();
      });
  }

  Stream<List<Task>> getAllTrue(Liste list) { 
    return groupCollection
      .doc(list.getIdGroup())
      .collection('List')
      .doc(list.getId())
      .collection('Task')
      .orderBy('deadline', descending: false)
      .where('state', isEqualTo: true)
      .snapshots()
      .map((QuerySnapshot snapshot) {
        return snapshot.docs.map((e) {
          return Task(
            e.id, 
            e.get('title'), 
            e.get('description'), 
            DateTime.fromMicrosecondsSinceEpoch(
              e.get('deadline')
              .microsecondsSinceEpoch
            ),
            e.get('state'), 
            list.getId(),
          );
        }).toList();
      });
  }

  Stream<List<Task>> getAllForToday(Liste list) { 
    return groupCollection
      .doc(list.getIdGroup())
      .collection('List')
      .doc(list.getId())
      .collection('Task')
      .where('deadline', isGreaterThanOrEqualTo: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0))
      .where('deadline', isLessThanOrEqualTo: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 59, 59))
      .snapshots()
      .map((QuerySnapshot snapshot) {
        return snapshot.docs.map((e) {
          return Task(
            e.id, 
            e.get('title'), 
            e.get('description'), 
            DateTime.fromMicrosecondsSinceEpoch(
              e.get('deadline')
              .microsecondsSinceEpoch
            ),
            e.get('state'), 
            list.getId(),
          );
        }).toList();
      });
  }

  //Alows us to delete the task
  Future delete(Task task) async {
    Liste list = await NoSqlList().getById(task.getIdList()); 

    return await groupCollection
      .doc(list.getIdGroup())
      .collection('List')
      .doc(list.getId())
      .collection('Task')
      .doc(task.getId())
      .delete();
  }

  Future update(Task task) async {
    Liste list = await NoSqlList().getById(task.getIdList());

    return await groupCollection
      .doc(list.getIdGroup())
      .collection('List')
      .doc(list.getId())
      .collection('Task')
      .doc(task.getId())
      .update({
        'title': task.getTitle(),
        'description': task.getDescription(),
        'deadline': task.getDeadline(),
      });
  }

  Future updateState(Task task) async {
    Liste list = await NoSqlList().getById(task.getIdList());

    return await groupCollection
      .doc(list.getIdGroup())
      .collection('List')
      .doc(list.getId())
      .collection('Task')
      .doc(task.getId())
      .update({
        'state': !task.getState()
      });
  }
}
