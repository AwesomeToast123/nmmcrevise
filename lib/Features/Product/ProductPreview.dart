// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:nmmcrevise/APICalls/ordersAPI.dart';
import 'package:nmmcrevise/APICalls/ordersAPI.dart';
import 'package:nmmcrevise/Features/Cart/cart_items.dart';
import 'package:nmmcrevise/APICalls/ordersAPI.dart';
import 'package:nmmcrevise/Features/Product/ProductPreview_Horizontal.dart';
import 'package:nmmcrevise/Features/Product/ProductPreview_Vertical.dart';

import '../Cart/cart.dart';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.spareparts,
  });

  List<Sparepart> spareparts;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        spareparts: List<Sparepart>.from(
            json["spareparts"].map((x) => Sparepart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "spareparts": List<dynamic>.from(spareparts.map((x) => x.toJson())),
      };
}

class Sparepart {
  Sparepart({
    required this.id,
    required this.name,
    required this.sku,
    required this.warehouse,
    required this.quantity,
  });
  String id;
  String name;
  String sku;
  String warehouse;
  int quantity;

  factory Sparepart.fromJson(Map<String, dynamic> json) => Sparepart(
        id: json["id"],
        name: json["name"],
        sku: json["sku"],
        warehouse: json["warehouse"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sku": sku,
        "warehouse": warehouse,
        "quantity": quantity,
      };
}

String Link =
    'http://localhost:7071/api/dealers/d5f9774b-783a-4ece-b210-cf9a7a7c2cea/order';

class ProdPreview extends StatefulWidget {
  final String name;
  final int quantity;
  final String warehouse;
  final String id;
  final String Tag;
  final String brand;

  const ProdPreview({
    Key? key,
    required this.id,
    required this.name,
    required this.quantity,
    required this.warehouse,
    required this.Tag,
    required this.brand,
  }) : super(key: key);
  @override
  _ProdPreviewState createState() => _ProdPreviewState(
        namee: name,
        quantityy: quantity,
        warehousee: warehouse,
        id: id,
        Tag: Tag,
        brand: brand,
      );
}

class _ProdPreviewState extends State<ProdPreview> {
  String Link =
      'http://localhost:7071/api/dealers/d5f9774b-783a-4ece-b210-cf9a7a7c2cea/order';

  late Future<Welcome> futureOrder;

  final String namee;
  final int quantityy;
  final String warehousee;
  final String id;
  final String Tag;
  final String brand;

  _ProdPreviewState({
    required this.namee,
    required this.quantityy,
    required this.warehousee,
    required this.id,
    required this.Tag,
    required this.brand,
  });

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    String available;
    bool keypad = true;

    bool isLocked = keypad ? quantityy != 0 : quantityy == 0;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 38, 110, 177),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: ((context, constraints) {
            if (constraints.maxWidth > 1000) {
              return ProdPreview_Horizontal(
                name: namee,
                Tag: Tag,
                id: id,
                warehouse: warehousee,
                quantity: quantityy,
                brand: brand,
              );
            } else {
              return ProdPreview_Vertical(
                name: namee,
                Tag: Tag,
                id: id,
                warehouse: warehousee,
                quantity: quantityy,
                brand: brand,
              );
            }
          }),
        ),
      ),
    );
  }
}
