import 'package:flutter/material.dart';
import 'package:todoey_flutter/components/task_list_tile.dart';

import '../screens/task_screen.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key, required this.tasks, required this.onAddClicked});

  final List<Task> tasks;
  final VoidCallback onAddClicked;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskListTile(
                task: widget.tasks[index],
                onChecked: (isChecked) {
                  setState(() {
                    widget.tasks[index] =
                        Task(widget.tasks[index].title, isChecked);
                  });
                },
              );
            },
            itemCount: widget.tasks.length,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {
              widget.onAddClicked();
            },
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(CircleBorder()),
              padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
              backgroundColor: MaterialStatePropertyAll(Colors.lightBlueAccent),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}
