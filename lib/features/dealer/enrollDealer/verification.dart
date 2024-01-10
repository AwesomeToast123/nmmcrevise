// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nmmcrevise/Features/Home_Screen/home.dart';
import 'package:nmmcrevise/Features/dealer/enrollDealer/enroll_Success.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  late final TextEditingController _controller3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            Icon(Icons.access_time_rounded, size: 300),
            SizedBox(height: 20),
            Text(
              "Almost there..",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 30),
            Text(
              "Input your Agent ID given to you",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: _controller3,
                decoration: InputDecoration(
                  hintText: 'Agent ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
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
                if (_controller3.text.isEmpty) {
                  Fluttertoast.showToast(
                    msg: 'Please complete the field',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Color.fromARGB(255, 38, 110, 177),
                    textColor: Colors.white,
                    fontSize: 16,
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const enroll_successScreen(),
                    ),
                  );
                }
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
