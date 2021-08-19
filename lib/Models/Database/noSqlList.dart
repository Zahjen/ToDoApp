import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_agenda/Models/Database/noSqlGroup.dart';
import 'package:my_agenda/Models/Pojo/group.dart';
import 'package:my_agenda/Models/Pojo/list.dart';

class NoSqlList {

  CollectionReference groupCollection = FirebaseFirestore.instance.collection('Group');
  
  Future<dynamic> insert(Liste list) async {
    return await groupCollection
      .doc(list.getIdGroup())
      .collection('List')
      .add({
        "title": list.getTitle()
      });
  }

  Stream<List<Liste>> getAllByGroup(Group group) {
    return groupCollection
      .doc(group.getId())
      .collection('List')
      .orderBy('title', descending: false)
      .snapshots()
      .map((QuerySnapshot snapshot) {
        return snapshot.docs.map((e) {
          return Liste(
            e.id, 
            e.get('title'), 
            group.getId()
          );
        }).toList();
      });
  }


  // This allows us to delete the selected list and the Task either in the db or in the screen
  Future<void> delete(Liste list) {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    return groupCollection
      .doc(list.getIdGroup())
      .collection('List')
      .doc(list.getId())
      .collection('Task')
      .get().then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
        querySnapshot
          .docs
          .forEach((QueryDocumentSnapshot<Map<String, dynamic>> document) {
            batch.delete(document.reference);
          });
        return batch.commit();
      }).whenComplete(() {
        groupCollection
          .doc(list.getIdGroup())
          .collection('List')
          .doc(list.getId())
          .delete();
      });
  }

  Future<void> update(Liste list) async {
    return await groupCollection
      .doc(list.getIdGroup())
      .collection('List')
      .doc(list.getId())
      .update({
        'title': list.getTitle()
      });
  }

  Future<Liste> getById(String idList) async {
    final groups = await NoSqlGroup().getAll().first;
    Liste listMatch = new Liste("-1", "error", "-1");
  
    for(final group in groups) {
      final lists = await NoSqlList().getAllByGroup(group).first;
      for(final list in lists) {
        if(list.getId() == idList) {
          listMatch = list;
        }
      }
    }
    if (listMatch.getId() == '-1') {
      throw new Exception("This id match any lists");
    }

    return listMatch;
  }

}