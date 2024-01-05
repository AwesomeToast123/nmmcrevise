// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nmmcrevise/Features/Cart/cart_items.dart';
import 'package:nmmcrevise/Features/dealer/dealerFail.dart';
import 'package:http/http.dart' as http;

WelcomeDealer welcomeDealerFromJson(String str) =>
    WelcomeDealer.fromJson(json.decode(str));

//String welcomeToJson(Welcome data) => json.encode(data.toJson());

class WelcomeDealer {
  WelcomeDealer({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.hash,
    required this.status,
  });

  String id;
  Name name;
  String address;
  String phoneNumber;
  String email;
  String hash;
  String status;

  factory WelcomeDealer.fromJson(Map<String, dynamic> json) => WelcomeDealer(
        id: json["id"],
        name: Name.fromJson(json["name"]),
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        hash: json["hash"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name.toJson(),
        "address": address,
        "phoneNumber": phoneNumber,
        "email": email,
        "hash": hash,
        "status": status,
      };
}

class Name {
  Name({
    required this.firstname,
    required this.middlename,
    required this.lastname,
    required this.secondname,
    required this.suffix,
  });

  String firstname;
  String middlename;
  String lastname;
  String secondname;
  String suffix;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        firstname: json["firstname"],
        middlename: json["middlename"],
        lastname: json["lastname"],
        secondname: json["secondname"],
        suffix: json["suffix"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "middlename": middlename,
        "lastname": lastname,
        "secondname": secondname,
        "suffix": suffix,
      };
}

String Link =
    'http://localhost:7071/api/dealers/d5f9774b-783a-4ece-b210-cf9a7a7c2cea';

Future<WelcomeDealer> fetchDealer() async {
  var response = await http.get(Uri.parse(Link));
  var bod = response.body;
  WelcomeDealer wel = WelcomeDealer.fromJson(jsonDecode(bod));
  return wel;
}

Future<WelcomeDealer> updateDealer(String address) async {
  final http.Response response = await http.patch(
    Uri.parse(
        'http://localhost:7071/api/dealers/d5f9774b-783a-4ece-b210-cf9a7a7c2cea'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'address': address.toString(),
    }),
  );

  if (response.statusCode == 200) {
    return WelcomeDealer.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed To update album');
  }
}

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  late final TextEditingController _address = TextEditingController();
  late Future<WelcomeDealer> add;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    add = fetchDealer();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 38, 110, 177),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Wrap(
          children: [
            SizedBox(height: 100),
            Container(
              child: SizedBox(
                width: w,
                height: h * 0.60,
                child: cart_item(quantity: 2),
              ),
            ),
            SizedBox(height: 100),
            FutureBuilder<WelcomeDealer>(
              future: add,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          /*
                          Text(
                            "Deliver to:",
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(width: 10, height: 10),
                          Text(
                            snapshot.data!.address,
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(width: 5),
                          TextButton(
                            onPressed: () {
                              _displayTextInputDialog(context);
                            },
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          */
                        ],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error.toString()}');
                } else if (snapshot.data == null) {
                  return MaterialApp(
                    home: Scaffold(
                      body: Container(
                        child: altDealer(),
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    bool isChecked = false;
    return showDialog(
        context: context,
        builder: (context) {
          Color getColor(Set<MaterialState> states) {
            const Set<MaterialState> interactiveStates = <MaterialState>{
              MaterialState.pressed,
              MaterialState.hovered,
              MaterialState.focused,
            };
            if (states.any(interactiveStates.contains)) {
              return Colors.blue;
            }
            return Colors.blue;
          }

          return AlertDialog(
            title: Text('New Address'),
            actions: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    add = updateDealer(_address.text);
                    Navigator.pop(context);
                  });
                },
                child: const Text('Update Address'),
              ),
            ],
          );
        });
  }
}
