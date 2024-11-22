import 'package:hive/hive.dart';

part 'task.g.dart'; // For Hive adapter generation

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final DateTime reminderTime;

  Task({required this.title, required this.reminderTime});
}
