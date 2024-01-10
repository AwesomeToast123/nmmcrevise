// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nmmcrevise/Features/Cart/cart_items.dart';

class CartUpdate extends StatefulWidget {
  const CartUpdate({Key? key}) : super(key: key);

  @override
  _CartUpdateState createState() => _CartUpdateState();
}

class _CartUpdateState extends State<CartUpdate> {
  int steppedIntInput = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 38, 110, 177),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                "Update Cart",
                style: TextStyle(fontSize: 45),
              ),
              SizedBox(height: 25),
              Expanded(
                child: cart_item(quantity: 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Deliver to:",
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(width: 10, height: 10),
                  Text(
                    "Address Name",
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Confirmation'),
                      content:
                          const Text('Are you sure you want these changes?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Yes'),
                          child: const Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'No'),
                          child: const Text('No'),
                        ),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    primary: Color.fromARGB(255, 38, 110, 177),
                  ),
                  child: Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
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
