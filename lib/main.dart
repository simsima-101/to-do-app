// lib/main.dart

import 'package:firebase_core/firebase_core.dart'; // Import firebase_core package
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart'; // Import Hive package
import 'screens/login_screen.dart'; // Import the LoginScreen
import 'screens/sign_up_screen.dart'; // Import the SignUpScreen
import 'task.dart'; // Import the Task model

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure proper initialization

  // Initialize Firebase
  await Firebase.initializeApp();

  // Initialize Hive and open the tasks box
  await openHiveBox();

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

// Main app widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      initialRoute: '/login', // Set initial route to login
      routes: {
        '/login': (context) => LoginScreen(), // Define LoginScreen route
        '/signup': (context) => SignUpScreen(), // Define SignUpScreen route
      },
    );
  }
}
