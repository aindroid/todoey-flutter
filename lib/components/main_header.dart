import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key, required this.count});

  final int count;

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
        Text(
          '$count Tasks',
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
