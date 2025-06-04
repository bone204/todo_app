enum AppText {
  textMyTodoList,
  textAddNewTask,
  textSave,
  textTaskTile,
  textDescription,
}

Map<AppText, String> texts = {
  AppText.textMyTodoList: "My Todo List",
  AppText.textAddNewTask: "Add New Task",
  AppText.textSave: "Save",
  AppText.textTaskTile: "Task Tile",
  AppText.textDescription: "Description",
};

extension AppTexts on AppText {
  static getStringValue(String value) {
    return value;
  }

  String get text => texts[this] ?? '--TextNotFound--'; 
}