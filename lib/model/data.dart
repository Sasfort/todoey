import 'dart:collection';

import 'package:flutter/material.dart';
import 'task.dart';

class Data extends ChangeNotifier {
  List<Task> _taskList = [];

  UnmodifiableListView<Task> get listOfTask {
    return UnmodifiableListView(_taskList);
  }

  int get taskCount {
    return _taskList.length;
  }

  void addTask(String newTask) {
    _taskList.add(
      Task(
        title: newTask,
      ),
    );
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleIsDone();
    notifyListeners();
  }

  void deleteTask(int indexRemove) {
    _taskList.removeAt(indexRemove);
    notifyListeners();
  }
}
