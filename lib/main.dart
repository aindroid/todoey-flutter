import 'package:flutter/material.dart';
import 'package:todoey_flutter/todoey/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(
            'Flutter apps',
            style: TextStyle(fontSize: 25),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Builder(builder: (context) {
            return ListView(children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/todoey');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ]);
          }),
        ),
      ),
      routes: {
        '/todoey': (BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.lightBlueAccent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: const TaskScreen(),
          );
        }
      },
    );
  }
}
