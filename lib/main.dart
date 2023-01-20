import 'package:flutter/material.dart';

import 'homepage.dart';

void main(List<String> args) {
  runApp(new app());
}

class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);

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
