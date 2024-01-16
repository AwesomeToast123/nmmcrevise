// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nmmcrevise/features/spareparts/spare_parts_horizontal.dart';
import 'package:nmmcrevise/features/spareparts/spare_parts_vertical.dart';

class SparePart extends StatefulWidget {
  const SparePart({Key? key}) : super(key: key);

  @override
  _SparePartstate createState() => _SparePartstate();
}

class _SparePartstate extends State<SparePart> {
  late Future<List<dynamic>> dyna;

  late Future<dynamic> dynna;
  String stauts = "The Hottest Picks";
  double textHeaderSize = 25;

  bool switchSearchName = false;
  bool switchSearchTag = false;
  bool switchSearchType = false;
  late String status = "Input Desired Search Item Here";

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: ((context, constraints) {
            if (constraints.maxWidth > 1000) {
              return SparePartsHorizontal();
            } else {
              return SparePartsVertical();
            }
          }),
        ),
      ),
    );
  }
}
