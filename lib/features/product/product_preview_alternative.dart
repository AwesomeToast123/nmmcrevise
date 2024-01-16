// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:nmmcrevise/api_services/orders_api_services.dart';
import 'package:nmmcrevise/Features/Cart/cart_items.dart';
import 'package:nmmcrevise/Features/Home_Screen/home.dart';



class ProdPreview2 extends StatefulWidget {
  final String name;
  final int quantity;
  final String warehouse;
  final String id;
  final String Tag;
  final String brand;

  const ProdPreview2({
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

class _ProdPreviewState extends State<ProdPreview2> {
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
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    String available;
    bool keypad = true;

    bool isLocked = keypad ? quantityy != 0 : quantityy == 0;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 40,
                            color: Color.fromARGB(255, 38, 110, 177),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              namee + ',' + Tag,
                              style: TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 38, 110, 177),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              brand,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 40,
                                color: Color.fromARGB(255, 38, 110, 177),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Quantity left:" + quantityy.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 40,
                                color: Color.fromARGB(255, 38, 110, 177),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Image(
                            width: w,
                            height: h * 0.40,
                            image: NetworkImage(
                                "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/pile-of-tires-on-white-background-royalty-free-image-672151801-1561751929.jpg?crop=1.00xw:0.629xh;0,0.318xh&resize=480:*"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: ButtonTheme(
                        minWidth: w * 0.50,
                        height: 90,
                        child: ElevatedButton(
                          onPressed: () async {
                            isLocked
                                ? setState(() {
                                    OrderCallsAPI().postorder(
                                        id, namee, warehousee, quantityy);

                                    Fluttertoast.showToast(
                                      msg: 'Item' + namee + 'Added To Cart!',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor:
                                          Color.fromARGB(255, 38, 110, 177),
                                      textColor: Colors.white,
                                      fontSize: 20,
                                    );

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            cart_item(quantity: quantityy),
                                      ),
                                    );
                                  })
                                : Fluttertoast.showToast(
                                    msg: "Product is not Available",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor:
                                        Color.fromARGB(255, 38, 110, 177),
                                    textColor: Colors.white,
                                    fontSize: 40,
                                  );
                          },
                          child: Text(
                            available =
                                isLocked ? "Add To Cart" : "Unavailable",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
