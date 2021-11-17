import '../../Models/Utils/exception.dart';

class Group {
  // Variables déclaration
  late String _id;
  late String _title;

  // Constructor
  Group(String id, String title) {
    this.setId(id);
    this.setTitle(title);
  }

  // Getters and Setters
  String getId() {
    return _id.trim();
  }
  void setId(String id) {
    String idTrim = id.trim();
    if (idTrim == "") {
      throw new PersonalizedException().groupId();
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
      throw new PersonalizedException().groupTitle();
    }
    else {
      this._title = titleTrim;
    }

  }
}
