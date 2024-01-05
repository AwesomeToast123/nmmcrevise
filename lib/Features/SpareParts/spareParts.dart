// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:nmmcrevise/APICalls/sparePartsAPI.dart';
import 'package:nmmcrevise/Features/Misc/Exception.dart';
import 'package:nmmcrevise/Features/Product/ProdcutPreviewSpec.dart';
import 'package:nmmcrevise/Features/Product/ProductPreview.dart';
import 'package:nmmcrevise/Features/SpareParts/sparePartsHorizontal.dart';
import 'package:nmmcrevise/Features/SpareParts/sparePartsVertical.dart';

class sparePart extends StatefulWidget {
  const sparePart({Key? key}) : super(key: key);

  @override
  _sparePartstate createState() => _sparePartstate();
}

class _sparePartstate extends State<sparePart> {
  late Future<List<dynamic>> dyna;

  late Future<dynamic> dynna;
  String stauts = "The Hottest Picks";
  double textHeaderSize = 25;

  bool switchSearchName = false;
  bool switchSearchTag = false;
  bool switchSearchType = false;
  late String status = "Input Desired Search Item Here";

  @override
  initState() {
    super.initState();
    dyna = sparePartsAPI().fetchParts();
    dynna = sparePartsAPI().fetchPartsByFrequencyAsc();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    TextEditingController controller = TextEditingController();

    var boxWidth = w * 0.50;
    var boxHeight = h * 0.50;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: ((context, constraints) {
            if (constraints.maxWidth > 1000) {
              return sparePartsHorizontal();
            } else {
              return sparePartsVertical();
            }
          }),
        ),
      ),
    );
  }
}
