// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nmmcrevise/Features/Home_Screen/home.dart';

class Checkout_Success extends StatefulWidget {
  final String id;

  const Checkout_Success({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _CheckoutSuccessState createState() => _CheckoutSuccessState(idd: id);
}

class _CheckoutSuccessState extends State<Checkout_Success> {
  final String idd;
  late Future<String> word;

  _CheckoutSuccessState({
    required this.idd,
  });

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Icon(Icons.check_circle_outline, size: 300),
              SizedBox(height: 30),
              Text(
                "Checkout Purchase Successful Your Order ID Number is:!" + idd,
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 46, 45, 45)),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Color.fromARGB(255, 38, 110, 177),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                  Fluttertoast.showToast(
                    msg: 'Thank you for your purchase!',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Color.fromARGB(255, 38, 110, 177),
                    textColor: Colors.white,
                    fontSize: 16,
                  );
                },
                child: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 30,
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
