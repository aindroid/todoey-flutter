import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: SafeArea(
          bottom: false,
          child: TaskScreen(),
        ),
      ),
    );
  }
}
