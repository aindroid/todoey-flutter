import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.task,
    required this.onChecked,
    required this.onRemove,
  });

  final Function(bool) onChecked;
  final VoidCallback onRemove;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        onRemove();
      },
      trailing: Transform.scale(
        scale: 1.2,
        child: Checkbox(
          activeColor: Colors.lightBlueAccent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            side: BorderSide(
              width: 3,
              color: Colors.black,
            ),
          ),
          value: task.done,
          onChanged: (value) => onChecked(value!),
        ),
      ),
      title: Text(
        task.title,
        style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            decoration:
                task.done ? TextDecoration.lineThrough : TextDecoration.none),
      ),
    );
  }
}
