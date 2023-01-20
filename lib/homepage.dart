import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todolist/dialogue.dart';
import 'package:todolist/todolist.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final _controller = TextEditingController();
  List todolistt = [
  
  ];
  void checkboxchanged(bool? value, int index) {
    setState(() {
      todolistt[index][1] = !todolistt[index][1];
    });
  }

  void savenewtask() {
    setState(() {
      todolistt.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
  }

  void createnewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return dialguebox(
          controller: _controller,
          onSave: savenewtask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deletetask(int index) {
    setState(() {
      todolistt.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        centerTitle: true,
        title: Text("To Do"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewtask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todolistt.length,
        itemBuilder: (context, index) {
          return todolist(
            taskcomplete: todolistt[index][1],
            taskname: todolistt[index][0],
            onchanged: (value) => checkboxchanged(value, index),
            deletetask: (p0) => deletetask(index),
          );
        },
      ),
    );
  }
}
