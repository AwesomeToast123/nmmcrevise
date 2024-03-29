// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:nmmcrevise/api_services/orders_api_services.dart';
import 'package:nmmcrevise/features/order_list/order_list_horizontal.dart';
import 'package:nmmcrevise/features/order_list/order_list_vertical.dart';


class Oder extends StatefulWidget {
  const Oder({Key? key}) : super(key: key);

  @override
  OderState createState() => OderState();
}

class OderState extends State<Oder> {
  late Future<List<dynamic>> spur;
  String valReason = "Reasons";

  double widthSize = 150;

  double heightSize = 45;
  double textButtonSize = 25;
  double textHeaderSize = 25;
  double textFooterSize = 20;

  @override
  void initState() {
    super.initState();
    spur = OrderCallsAPI().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 38, 110, 177),
          title: Text("List of Orders"),
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
              return OderHorizontal();
            } else {
              return OderVertical();
            }
          }),
        ),
      ),
    );
  }
}
