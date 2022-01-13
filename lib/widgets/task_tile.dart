import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function checkboxCallback;
  final Function longpressCallback;

  TaskTile(
      {required this.title,
      this.isChecked = false,
      required this.checkboxCallback,
      required this.longpressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (checkboxState) {
          checkboxCallback();
        },
      ),
      onLongPress: () {
        longpressCallback();
      },
    );
  }
}
