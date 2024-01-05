// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nmmcrevise/Features/Cart/cart_items.dart';
import 'package:nmmcrevise/Features/checkout/checkout_screen.dart';

class Checkout_Screen extends StatefulWidget {
  const Checkout_Screen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<Checkout_Screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Text("chicken out"),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      child: cart_item(quantity: 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
