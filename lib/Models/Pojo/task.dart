import 'package:my_agenda/Models/Utils/exception.dart';

class Task {
  // Variables declaration
  late String _id;
  late String _title;
  late String _description;
  late DateTime _deadline;
  late bool _state;
  late String _idList;

  // Constructor
  Task(String id, String title, String description, DateTime deadline, bool state, String idList) {
    this.setId(id);
    this.setTitle(title);
    this.setDescription(description);
    this.setDeadline(deadline);
    this.setState(state);
    this.setIdList(idList);
  }

  // Getters and setters
  String getId() {
    return _id.trim();
  }
  void setId(String id) {
    String idTrim = id.trim();
    if (idTrim == "") {
      throw new PersonalizedException().taskId();
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
      throw new PersonalizedException().taskTitle();
    }
    else {
      this._title = titleTrim;
    }
  }

  String getDescription() {
    return _description.trim();
  }
  void setDescription(String description) {
    String descriptionTrim = description.trim();
    if (descriptionTrim == "") {
      throw new PersonalizedException().taskDescripion();
    }
    else {
      this._description = descriptionTrim;
    }
  }

  DateTime getDeadline() {
    return _deadline;
  }
  void setDeadline(DateTime deadline) {
      this._deadline = deadline;
  }

  bool getState() {
    return _state;
  }
  void setState(bool state) {
      this._state = state;
  }

  String getIdList() {
    return _idList.trim();
  }
  void setIdList(String idList) {
    String idListTrim = idList.trim();
    if (idListTrim == "") {
      throw new PersonalizedException().listId();
    }
    else {
      this._idList = idListTrim;
    }
  }
}
