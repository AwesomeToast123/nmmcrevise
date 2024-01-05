// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_string_interpolations, non_constant_identifier_names, unused_element, avoid_unnecessary_containers, dead_code

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nmmcrevise/APICalls/cartAPI.dart';
import 'package:nmmcrevise/APICalls/dealerAPI.dart';
import 'package:nmmcrevise/Features/Cart/cart_items_horizontal.dart';
import 'package:nmmcrevise/Features/Cart/cart_items_vertical.dart';
import 'package:nmmcrevise/Features/OrderList/orders.dart';
import 'package:nmmcrevise/Features/checkout/checkoutscreen_success.dart';
import 'package:quantity_input/quantity_input.dart';

class cart_item extends StatefulWidget {
  final int quantity;

  const cart_item({required this.quantity, Key? key});

  @override
  _cartitemState createState() => _cartitemState(quantity: quantity);
}

class _cartitemState extends State<cart_item> {
  int steppedIntInput = 0;
  final int quantity;

  _cartitemState({required this.quantity});

  late final TextEditingController _address = TextEditingController();

  late bool ischecked = true;
  double widthButton = 200;
  double heightButton = 50;
  double textHeaderSize = 30;
  double textFooterSize = 25;
  double textFooterSizeLittle = 25;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 38, 110, 177),
          title: Text("Cart"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        body: LayoutBuilder(
          builder: ((context, constraints) {
            if (constraints.maxWidth > 1000) {
              return cart_item_Horizontal(quantity: quantity);
            } else {
              return cart_item_Vertical(quantity: quantity);
            }
          }),
        ),
      ),
    );
  }
}
