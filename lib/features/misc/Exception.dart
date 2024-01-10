// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  //final FlutterErrorDetails errorDetails;
  final String azov;

  const CustomError({
    Key? key,
    required this.azov,
  })  : assert(azov != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        child: Text(
          "Something is not right here...",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: const EdgeInsets.all(8.0),
      ),
      color: Color.fromARGB(255, 38, 110, 177),
      margin: EdgeInsets.zero,
    );
  }
}
