import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/features/addtask/data/task_model.dart';

class AppLocalStorage {
  static late Box userbox;
  static late Box taskbox;
  static init() {
    userbox = Hive.box('user');
    taskbox = Hive.box<TaskModel>('task');
  }

  static cashData(key, value) {
    userbox.put(key, value);
  }

  getCashData(key) {
    return userbox.get(key);
  }

  static cashtaskbox(key, value) {
    taskbox.put(key, value);
  }

  gettaskbox(key) {
    return taskbox.get(key);
  }
}
