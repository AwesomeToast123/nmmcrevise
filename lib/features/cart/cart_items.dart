// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_string_interpolations, non_constant_identifier_names, unused_element, avoid_unnecessary_containers, dead_code

import 'package:flutter/material.dart';
import 'package:nmmcrevise/Features/Cart/cart_items_horizontal.dart';
import 'package:nmmcrevise/Features/Cart/cart_items_vertical.dart';


class CarItem extends StatefulWidget {
  final int quantity;

  const CarItem({required this.quantity, Key? key});

  @override
  _CartItemState createState() => _CartItemState(quantity: quantity);
}

class _CartItemState extends State<CarItem> {
  int steppedIntInput = 0;
  final int quantity;

  _CartItemState({required this.quantity});

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
