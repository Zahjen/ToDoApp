class PersonalizedException implements Exception {

  String groupTitle() {
    return "The title of the group should not be empty";
  }

  String groupId() {
    return "The id of the group should not be empty";
  }

  String listTitle() {
    return "The title of the list should not be empty";
  }

  String listId() {
    return "The id of the list should not be empty";
  }

  String taskTitle() {
    return "The title of the task should not be empty";
  }

  String taskDescripion() {
    return "The description of the task should not be empty";
  }

  String taskId() {
    return "The id of the task should not be empty";
  }

}