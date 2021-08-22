import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_agenda/Models/Database/noSqlList.dart';
import 'package:my_agenda/Models/Pojo/group.dart';
import 'package:my_agenda/Models/Pojo/list.dart';

class NoSqlGroup {

  CollectionReference groupCollection = FirebaseFirestore.instance.collection('Group');

  // Create a new group 
  Future create(Group group) async {
    return await groupCollection.add({
      "title": group.getTitle(),
    });
  }

  // Get a list of all group from db
  Stream<List<Group>> getAll() {
    return groupCollection
      .orderBy('title', descending: false)
      .snapshots()
      .map((QuerySnapshot snapshot) {
        return snapshot.docs.map((e) {
          return Group(e.id, e.get('title'));
        }).toList();
      });
  }

  // Get a group thanks to its id
  Future<Group> getById(String idGroup) async {
    var groupDoc = await groupCollection
        .doc(idGroup)
        .get();
    Group group = new Group(groupDoc.id, groupDoc['title']);
    return group;
  }

  // Delete the selected group, list and the Task either in the db or in the screen
  Future<void> delete(Group group) async {
    List<Liste> lists = await NoSqlList().getAllByGroup(group).first;

    lists.forEach((list) {
      NoSqlList().delete(list);
    });

    return groupCollection.doc(group.getId()).delete();
  }
  
  // Update title of a group
  Future<void> update(Group group) async {
    return await groupCollection
      .doc(group.getId())
      .update({
        'title': group.getTitle()
      });
  }
}
