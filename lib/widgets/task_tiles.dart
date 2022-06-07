import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallBack;
  final Function callLongPressButton;
  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallBack,
      required this.callLongPressButton});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        callLongPressButton();
      },
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (newValue) {
          checkboxCallBack(newValue);
          //  isChecked=newValue;
        },
        activeColor: Colors.lightBlueAccent,
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final Function toggleCheckboxState;
  const TaskCheckbox(
      {required this.checkboxState, required this.toggleCheckboxState});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: toggleCheckboxState(),
    );
  }
}
