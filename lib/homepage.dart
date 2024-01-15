import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:todolist/data/database.dart';
import 'package:todolist/dialogue.dart';
import 'package:todolist/todolist.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override

  final _mybox = Hive.box('mybox');
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.createinitaldata();
    } else {
      db.loaddata();
    }
    // TODO: implement initState
    super.initState();
  }

  

  final _controller = TextEditingController();
  // List todolistt = [];

  Tododatabase db = Tododatabase();
  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.todolistt[index][1] = !db.todolistt[index][1];
    });
    db.updatedatabase();
  }

  void savenewtask() {
    setState(() {
      db.todolistt.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
    db.updatedatabase();
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
    db.updatedatabase();
  }

  void deletetask(int index) {
    setState(() {
      db.todolistt.removeAt(index);
    });
    db.updatedatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      
       
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("To Do"),
      //   elevation: 5,
      // ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: createnewtask,
        child: Icon(Icons.add),
      ),
      body: 
      
      
      
      ListView.builder(
        itemCount: db.todolistt.length,
        itemBuilder: (context, index) {
          return todolist(
            taskcomplete: db.todolistt[index][1],
            taskname: db.todolistt[index][0],
            onchanged: (value) => checkboxchanged(value, index),
            deletetask: (p0) => deletetask(index),
          );
        },
      ),
    );
  }
}
