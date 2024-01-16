import 'package:flutter/material.dart';
import 'package:nmmcrevise/features/order_list/orders.dart';

class DealerSuccessScreen extends StatelessWidget {
  const DealerSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.check_circle_outline_sharp, size: 300),
            SizedBox(height: 30),
            // ignore: prefer_const_constructors
            Text(
              "Success!",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            SizedBox(height: 30),
            Text(
              'Dealer Enrolled',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Oder(),
                  ),
                );
              },
              child: Text(
                'Begin your journey',
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
