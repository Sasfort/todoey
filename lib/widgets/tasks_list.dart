import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/model/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(builder: (context, data, child) {
      return ListView.builder(
        padding: EdgeInsets.all(0.0),
        itemBuilder: (context, index) {
          final Task thisTask = data.listOfTask[index];
          return TaskTile(
            title: thisTask.title,
            isChecked: thisTask.isDone,
            checkboxCallback: () {
              data.updateTask(thisTask);
            },
            longpressCallback: () {
              data.deleteTask(index);
            },
          );
        },
        itemCount: data.taskCount,
      );
    });
  }
}
