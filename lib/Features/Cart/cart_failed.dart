// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:http/http.dart' as http;

class spareParts {
  String name;
  String warehouse;
  String id;
  String quantity;

  spareParts({
    required this.name,
    required this.id,
    required this.warehouse,
    required this.quantity,
  });

  factory spareParts.fromJson(Map<String, dynamic> json) => spareParts(
        name: json["name"],
        warehouse: json["warehouse"],
        id: json["id"],
        quantity: json["quantity"],
      );
}

Future<List<spareParts>> fetchParts() async {
  final response = await http.get(
      Uri.parse('http://localhost:7071/api/spareparts'),
      headers: {"Accept": "application/json", "Access-Control_Origin": "*"});

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    List<spareParts> parts = [];

    for (var u in jsonResponse) {
      spareParts part = spareParts(
        name: u['name'].toString(),
        id: u['id'].toString(),
        warehouse: u['warehouse'].toString(),
        quantity: u['quantity'].toString(),
      );
      parts.add(part);
    }
    return parts;
  } else {
    throw Exception('Failed to load parts');
  }
}

class Cart_failed extends StatefulWidget {
  const Cart_failed({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart_failed> {
  int steppedIntInput = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 38, 110, 177),
        ),
        body: Column(
          children: [
            SizedBox(height: 30),
            Text(
              "Order Cart",
              style: TextStyle(fontSize: 45),
            ),
            SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black26,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image(
                    width: 200,
                    height: 150,
                    image: NetworkImage(
                        "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/pile-of-tires-on-white-background-royalty-free-image-672151801-1561751929.jpg?crop=1.00xw:0.629xh;0,0.318xh&resize=480:*"),
                  ),
                  Column(
                    children: [
                      Text(
                        "Zeta Tires",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Warehouse cebu",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 320),
                  QuantityInput(
                    value: steppedIntInput,
                    step: 1,
                    onChanged: (value) => setState(
                      () => steppedIntInput = int.parse(
                        value.replaceAll(',', ''),
                      ),
                    ),
                    buttonColor: Color.fromARGB(255, 38, 110, 177),
                  ),
                  SizedBox(width: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete, size: 50),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Deliver to:",
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 40,
                  ),
                ),
                SizedBox(width: 10, height: 10),
                Text(
                  "Address Name",
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Container(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Checkout',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Color.fromARGB(255, 38, 110, 177),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
