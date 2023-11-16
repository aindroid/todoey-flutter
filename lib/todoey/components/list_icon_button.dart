import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  const IconButton({
    super.key,
    required this.callback,
  });

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        backgroundColor: Colors.white,
        foregroundColor: Colors.lightBlueAccent.withOpacity(0.1),
      ),
      child: const Icon(
        Icons.list,
        color: Colors.lightBlueAccent,
        size: 50,
      ),
    );
  }
}
