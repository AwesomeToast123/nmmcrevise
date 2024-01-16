// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nmmcrevise/Features/dealer/enrollDealer/post_dealer.dart';

class EnrollFailureScreen extends StatelessWidget {
  const EnrollFailureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.delete, size: 300),
            SizedBox(height: 30),
            Text(
              "Failed",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const dealerEnroll(),
                  ),
                );
              },
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
