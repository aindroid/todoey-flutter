import 'package:flutter/material.dart';
import 'package:todoey_flutter/components/task_list.dart';

import '../components/main_header.dart';
import '../modals/add_task_bottom_sheet.dart';

class Task {
  Task(this.title, this.done);
  final String title;
  final bool done;
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [
    Task('title 1', false),
    Task('title 2', false),
    Task('title 2', false),
    Task('title 2', false),
    Task('title 2', false),
    Task('title 2', false),
    Task('title 2', false),
    Task('title 2', false),
    Task('title 2', false),
    Task('title 2', false),
    Task('title 2', false)
  ];

  void showAddTaskModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      // barrierColor: Colors.white54,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return AddTaskBottomSheet(
          itemAddedCallback: (item) {
            setState(() {
              tasks.add(Task(item, false));
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 30,
            right: 30,
            bottom: 60,
          ),
          child: MainHeader(
            count: tasks.length,
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(40),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: TaskList(
              tasks: tasks,
              onAddClicked: () => showAddTaskModal(context),
            ),
          ),
        ),
      ],
    );
  }
}
