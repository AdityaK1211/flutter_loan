import 'dart:math';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Body_Material extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        color: Colors.lightBlueAccent,
        child: Center(
            child: Text(
                generateNumber(),
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.white, fontSize: 40.0)
            )
        )
    );
  }

  String generateNumber() {
    var random = Random();
    int num = random.nextInt(10);

    return "Number is $num";
}
}