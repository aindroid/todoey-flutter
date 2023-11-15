import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/components/task_list.dart';
import 'package:todoey_flutter/models/tasks.dart';

import '../components/main_header.dart';
import '../modals/add_task_bottom_sheet.dart';
import '../models/task.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  void showAddTaskModal(BuildContext context) {
    Tasks tasks = Provider.of<Tasks>(context, listen: false);
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
            tasks.addTask(Task(item, false));
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Tasks(),
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 40,
                left: 30,
                right: 30,
                bottom: 60,
              ),
              child: MainHeader(),
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
                child: Consumer<Tasks>(
                  builder: (context, value, child) {
                    return TaskList(
                      onAddClicked: () => showAddTaskModal(context),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
