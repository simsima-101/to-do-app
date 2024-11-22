import 'package:hive/hive.dart';

part 'task.g.dart'; // This is necessary for the build_runner to generate the Hive adapter

@HiveType(typeId: 0) // Unique identifier for the Task model in Hive
class Task {
  @HiveField(0) // Marks the field to be stored in Hive
  final String title;

  @HiveField(1) // Marks the field to be stored in Hive
  final DateTime reminderTime;

  // Constructor for the Task class
  Task({required this.title, required this.reminderTime});
}
