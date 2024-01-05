// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, no_logic_in_create_state, dead_code
/*
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:nmmc_app/APICalls/ordersAPI.dart';
import 'package:nmmc_app/APICalls/ordersAPI.dart';
import 'package:nmmc_app/APICalls/sparePartsAPI.dart';
import 'package:nmmc_app/Features/Cart/cart_items.dart';
import 'package:nmmc_app/APICalls/ordersAPI.dart';

import '../Cart/cart.dart';

class ProdPreviewSpecid extends StatefulWidget {
  final String id;

  const ProdPreviewSpecid({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  _ProdPreviewState createState() => _ProdPreviewState(id: id);
}

class _ProdPreviewState extends State<ProdPreviewSpecid> {
  final String id;
  late Future<dynamic> dynaa;

  _ProdPreviewState({
    required this.id,
  });

  void initState() {
    super.initState();
    dynaa = sparePartsAPI().fetchSpecificParts2(id);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    String available;
    bool keypad = true;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: FutureBuilder<dynamic>(
              future: dynaa,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      bool isLocked = keypad
                          ? snapshot.data!.quantity != 0
                          : snapshot.data!.quantity;

                      /*
                      String name = snapshot.data![index].name;
                      String tag = snapshot.data![index].tags;
                      String brand = snapshot.data![index].brand;
                      int quantity = snapshot.data![index].quantity;
                      String warehouse = snapshot.data![index].warehouse;
                      */

                      return Padding(
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
                                    Navigator.pop(context);
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
                                      snapshot.data!.name +
                                          ',' +
                                          snapshot.data!.tags,
                                      style: TextStyle(
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 38, 110, 177),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      snapshot.data!.brand,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 40,
                                        color:
                                            Color.fromARGB(255, 38, 110, 177),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Quantity left:" +
                                          snapshot.data!.quantity,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 40,
                                        color:
                                            Color.fromARGB(255, 38, 110, 177),
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
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                  ),
                                  onPressed: () async {
                                    isLocked
                                        ? setState(() {
                                            OrderCallsAPI().postorder(
                                              id,
                                              snapshot.data!.name,
                                              snapshot.data!.warehouse,
                                              snapshot.data!.quantity,
                                            );

                                            Fluttertoast.showToast(
                                              msg: 'Item' +
                                                  snapshot.data!.name +
                                                  'Added To Cart!',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              backgroundColor: Color.fromARGB(
                                                  255, 38, 110, 177),
                                              textColor: Colors.white,
                                              fontSize: 20,
                                            );

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    cart_item(quantity: ),
                                              ),
                                            );
                                          })
                                        : Fluttertoast.showToast(
                                            msg: "Product is not Available",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            backgroundColor: Color.fromARGB(
                                                255, 38, 110, 177),
                                            textColor: Colors.white,
                                            fontSize: 40,
                                          );
                                  },
                                  color: Color.fromARGB(255, 38, 110, 177),
                                  child: Text(
                                    available = isLocked
                                        ? "Add To Cart"
                                        : "Unavailable",
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
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error.toString()}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
*/
