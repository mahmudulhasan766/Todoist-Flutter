import 'package:get_storage/get_storage.dart';
import 'package:todoist/model/task_model.dart';

class LocalDataHelper {
  var box = GetStorage();

  saveData(Task task) {
    box.write('task', task);
  }
  List<Task> getData() {
    var task = box.read('task');
    return task;
  }

}