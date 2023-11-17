import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, 
    required this.text,
    required this.color,
    required this.callback,
  });

  final String text;
  final Color color;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () {
            callback();
          },
          minWidth: 200.0,
          height: 42.0,
          textColor: Colors.white,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
