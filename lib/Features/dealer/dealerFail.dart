// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:nmmcrevise/Features//dealer/enrollDealer/post_dealer.dart';

class altDealer extends StatefulWidget {
  @override
  _altDealerState createState() => _altDealerState();
}

class _altDealerState extends State<altDealer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      left: true,
      top: true,
      right: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 38, 110, 177),
          body: Column(
            children: [
              DrawerHeader(
                child: Image.network(
                  'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Text(
                  "Unamed Dealer, Please Verify and enroll",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const dealerEnroll(),
                    ),
                  );
                },
                child: Text(
                  'Enroll',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
