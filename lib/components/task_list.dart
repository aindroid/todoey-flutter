import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/components/task_list_tile.dart';
import 'package:todoey_flutter/models/tasks.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.onAddClicked});

  final VoidCallback onAddClicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: Consumer<Tasks>(
            builder: (context, value, child) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return TaskListTile(
                    task: value.getTask(index),
                    onChecked: (isChecked) {
                      value.checkTask(index, isChecked);
                    },
                  );
                },
                itemCount: value.count,
              );
            },
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {
              onAddClicked();
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
