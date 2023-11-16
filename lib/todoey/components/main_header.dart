import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/tasks.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 35,
          child: Icon(
            Icons.list,
            color: Colors.lightBlueAccent,
            size: 50,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Todoey',
          style: TextStyle(
            color: Colors.white,
            fontSize: 60,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Consumer<Tasks>(
          builder: (context, value, child) {
            return Text(
              '${value.count} Tasks',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            );
          },
        ),
      ],
    );
  }
}
