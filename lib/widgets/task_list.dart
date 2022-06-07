// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:todo_list/models/task_data.dart';
import 'package:todo_list/widgets/task_tiles.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            return TaskTile(
                callLongPressButton: () {
                  taskData.deleteTask(taskData.tasks[index]);
                },
                isChecked: taskData.tasks[index].isDone,
                taskTitle: taskData.tasks[index].name,
                checkboxCallBack: (checkBoxState) {
                  taskData.updateTask(taskData.tasks[index]);
                  // setState(() {
                  //   widget.tasks[index].toggleDone();
                  // });
                });
          });
    });
  }
}
