import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({
    super.key,
    required this.color,
    this.size = 40,
  });

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: size,
      onPressed: () => {
        Navigator.popUntil(
          context,
          ModalRoute.withName('/'),
        )
      },
      icon: Icon(
        Icons.arrow_back,
        color: color,
      ),
    );
  }
}
