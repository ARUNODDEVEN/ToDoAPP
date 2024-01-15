import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todolist extends StatelessWidget {
  final String taskname;
  final bool taskcomplete;

  Function(bool?)? onchanged;

  Function(BuildContext)? deletetask;

  todolist({
    super.key,
    required this.taskcomplete,
    required this.taskname,
    required this.onchanged,
    required this.deletetask,
    
  }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletetask,
              icon: Icons.delete,
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(
                value: taskcomplete,
                onChanged: onchanged,
                activeColor: Colors.black,
              ),
              Text(
                taskname,
                style: TextStyle(
                  decoration: taskcomplete
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
