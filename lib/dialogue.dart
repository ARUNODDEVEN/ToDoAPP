import 'package:flutter/material.dart';
import 'package:todolist/button.dart';

class dialguebox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  
      dialguebox({
      super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel
      }
      );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                button(text: "Save", onPressed: onSave),
                const SizedBox(width: 8),
                button(text: "Cancel", onPressed:onCancel)
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }
}
