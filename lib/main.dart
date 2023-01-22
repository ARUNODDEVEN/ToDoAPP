import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'homepage.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  var box = await Hive.openBox('Mybox');
  runApp(new app());
}

class app extends StatefulWidget {
  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}
