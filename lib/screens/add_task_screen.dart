import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskTitle = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30.0,
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              setState(() {
                this.taskTitle = value;
              });
            },
          ),
          TextButton(
            onPressed: () {
              if (taskTitle != "") {
                Provider.of<Data>(context, listen: false).addTask(taskTitle);
                Navigator.pop(context);
              }
            },
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.lightBlueAccent,
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
      ),
    );
  }
}
