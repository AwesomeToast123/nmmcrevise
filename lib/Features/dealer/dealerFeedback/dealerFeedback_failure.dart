import 'package:flutter/material.dart';
import 'package:nmmcrevise/Features/dealer/dealerFeedback/post_feedback.dart';

class dealer_failureScreen extends StatelessWidget {
  const dealer_failureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.delete, size: 300),
            SizedBox(height: 30),
            Text(
              "Posting Feedback Failed",
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
                    builder: (context) => const postfeedBack(),
                  ),
                );
              },
              child: Text(
                'Go Back',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
