// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nmmcrevise/features/product/product_preview_horizontal.dart';
import 'package:nmmcrevise/features/product/product_preview_vertical.dart';



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
