import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class button extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  button(
    {super.key,
    required this.text, 
    required this.onPressed
    }
  );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        child: Text(text),
        color: Colors.grey,focusColor: Colors.amber,highlightElevation: 2,highlightColor: Color.fromARGB(255, 255, 255, 255),splashColor: Color.fromARGB(255, 0, 0, 0),
        );
      
    
  
  
  }
}
