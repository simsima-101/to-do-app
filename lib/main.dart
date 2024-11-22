import 'package:firebase_core/firebase_core.dart'; // Import firebase_core package
import 'package:flutter/material.dart'; // Import Flutter material package
import 'package:flutter_local_notifications/flutter_local_notifications.dart'; // Import local notifications package
import 'package:hive_flutter/hive_flutter.dart'; // Import Hive package
import 'screens/login_screen.dart'; // Import the LoginScreen
import 'screens/sign_up_screen.dart'; // Import the SignUpScreen
import 'screens/calendar_screen.dart'; // Import the CalendarScreen
import 'screens/task_list_screen.dart'; // Import TaskListScreen
import 'screens/add_task_screen.dart'; // Import AddTaskScreen
import 'task.dart'; // Import the Task model

// Initialize Flutter Local Notifications plugin
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure proper initialization

  // Initialize Firebase
  await Firebase.initializeApp();

  // Initialize Hive and open the tasks box
  await openHiveBox();

  // Initialize Local Notifications
  initializeNotifications();

  // Run the app
  runApp(MyApp());
}

// Function to initialize Hive and open a box for tasks
Future<void> openHiveBox() async {
  await Hive.initFlutter(); // Initializes Hive for Flutter

  // Register the Task adapter (required for custom models)
  Hive.registerAdapter(TaskAdapter());

  // Open a box to store tasks
  await Hive.openBox<Task>('tasks');
}

// Function to initialize Flutter Local Notifications
void initializeNotifications() {
  const android = AndroidInitializationSettings('@mipmap/ic_launcher');
  const iOS = IOSInitializationSettings();
  const initSettings = InitializationSettings(android: android, iOS: iOS);
  flutterLocalNotificationsPlugin.initialize(initSettings);
}

// Main app widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define the primary theme color
      ),
      initialRoute: '/login', // Set initial route to login
      routes: {
        '/login': (context) => LoginScreen(), // Define LoginScreen route
        '/signup': (context) => SignUpScreen(), // Define SignUpScreen route
        '/calendar': (context) =>
            CalendarScreen(), // Define CalendarScreen route
        '/taskList': (context) =>
            TaskListScreen(), // Define TaskListScreen route
        '/addTask': (context) => AddTaskScreen(), // Define AddTaskScreen route
      },
    );
  }
}
