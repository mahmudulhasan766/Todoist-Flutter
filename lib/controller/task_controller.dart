import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/local_data.dart';
import '../model/task_model.dart';

class TaskController extends GetxController{
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  List<Task> toDoList = <Task>[];



  //Create Task
  void createNewTask(Task task) {
    debugPrint(task.title);
    final newTask = Task(
      title: task.title,
      details: task.details,
      isChecked: false,
    );
    //add local database
    LocalDataHelper().saveData(newTask);
    toDoList.add(newTask);
    update();
  }

  //delete task
  void deleteTask(int index) {
    toDoList.removeAt(index);
    update();
  }
  //update tack
  updateStatus(int index) {
    toDoList[index].isChecked = !toDoList[index].isChecked!;
    update();
  }

}