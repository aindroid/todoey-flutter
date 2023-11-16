import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {
  AddTaskBottomSheet({
    super.key,
    required this.itemAddedCallback,
  });

  final Function(String) itemAddedCallback;
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 40,
            right: 40,
            top: 30,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _textController,
                autofocus: true,
                style: const TextStyle(
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  focusColor: Colors.lightBlueAccent,
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 5, color: Colors.lightBlueAccent),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    if (_textController.value.text.isNotEmpty) {
                      itemAddedCallback(_textController.value.text);
                      Navigator.pop(context);
                    }
                  },
                  style: const ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(200, 70)),
                    shape:
                        MaterialStatePropertyAll(ContinuousRectangleBorder()),
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.lightBlueAccent),
                  ),
                  child: const Text(
                    'Add',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
