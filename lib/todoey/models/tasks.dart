import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/todoey/models/task.dart';

class Tasks with ChangeNotifier {
  final List<Task> _tasks = [
    Task('title 1', false),
    Task('title 2', false),
    Task('title 3', false),
    Task('title 4', false),
  ];

  int get count => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  Task getTask(int index) => _tasks[index];

  void checkTask(int index, bool checked) {
    _tasks[index] = Task(_tasks[index].title, checked);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}
