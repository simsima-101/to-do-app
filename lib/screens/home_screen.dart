// lib/screens/home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const Center(
        child: Text(
          "Welcome to Home Screen",
          style:
              TextStyle(fontSize: 20), // You can add style here for better UI
        ),
      ),
    );
  }
}
