import '../../Models/Utils/exception.dart';

class Liste {
  // Variables declaration
  late String _id;
  late String _title;
  late String _idGroup;

  // Constructor
  Liste(String id, String title, String idGroup) {
    this.setId(id);
    this.setTitle(title);
    this.setIdGroup(idGroup);
  }

  // Getters and Setters
  String getId() {
    return _id.trim();
  }
  void setId(String id) {
    String idTrim = id.trim();
    if (idTrim == "") {
      throw new PersonalizedException().listId();
    }
    else {
      this._id = idTrim;
    }
  }
  
  String getTitle() {
    return _title.trim();
  }
  void setTitle(String title) {
    String titleTrim = title.trim();
    if (titleTrim == "") {
      throw new PersonalizedException().listTitle();
    }
    else {
      this._title = titleTrim;
    }
  }

  String getIdGroup() {
    return _idGroup.trim();
  }
  void setIdGroup(String idGroup) {
    String idGroupTrim = idGroup.trim();
    if (idGroupTrim == "") {
      throw new PersonalizedException().groupId();
    }
    else {
      this._idGroup = idGroupTrim;
    }
  }
}
