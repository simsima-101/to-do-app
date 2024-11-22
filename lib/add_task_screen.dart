import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../task.dart'; // Import Task model

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  DateTime? _reminderTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Task Title'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (selectedDate != null) {
                  setState(() {
                    _reminderTime = selectedDate;
                  });
                }
              },
              child: Text(
                _reminderTime == null
                    ? 'Select Reminder Date'
                    : 'Reminder: ${_reminderTime!.toLocal()}',
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty && _reminderTime != null) {
                  final newTask = Task(
                    title: _titleController.text,
                    reminderTime: _reminderTime!,
                  );
                  Hive.box<Task>('tasks').add(newTask); // Save task to Hive
                  Navigator.pop(context); // Go back to TaskListScreen
                }
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
