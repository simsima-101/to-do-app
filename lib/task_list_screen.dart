import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../task.dart'; // Import Task model

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskBox = Hive.box<Task>('tasks');

    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      body: ListView.builder(
        itemCount: taskBox.length,
        itemBuilder: (context, index) {
          final task = taskBox.getAt(index);
          return ListTile(
            title: Text(task!.title),
            subtitle: Text('Reminder: ${task.reminderTime}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addTask'); // Navigate to AddTaskScreen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
