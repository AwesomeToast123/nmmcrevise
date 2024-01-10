// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_string_interpolations, non_constant_identifier_names, unused_element, avoid_unnecessary_containers, dead_code

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nmmcrevise/api_services/cart_api_services.dart';
import 'package:nmmcrevise/api_services/dealer_api_services.dart';
import 'package:nmmcrevise/Features/OrderList/orders.dart';
import 'package:quantity_input/quantity_input.dart';

class cart_item_Vertical extends StatefulWidget {
  final int quantity;

  const cart_item_Vertical({required this.quantity, Key? key})
      : super(key: key);

  @override
  _cartitemState createState() => _cartitemState(quantity: quantity);
}

class _cartitemState extends State<cart_item_Vertical> {
  int steppedIntInput = 0;
  final int quantity;

  late final TextEditingController _address = TextEditingController();

  _cartitemState({required this.quantity, Key? key});

  late bool ischecked = true;
  double widthButton = 100;
  double heightButton = 20;
  double textHeaderSize = 20;
  double textFooterSize = 20;
  double textFooterSizeLittle = 20;



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
        body: Container(
          width: w,
          child: FutureBuilder<dynamic>(
            future: CartItemAPI().fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black26,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: <Widget>[
                            Image(
                              width: 150,
                              height: 150,
                              image: NetworkImage(
                                  "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/pile-of-tires-on-white-background-royalty-free-image-672151801-1561751929.jpg?crop=1.00xw:0.629xh;0,0.318xh&resize=480:*"),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Part Name",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: textHeaderSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  snapshot.data![index].spareparts[0].name,
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: textFooterSize,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Posted In:",
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          snapshot.data![index].created,
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Brand",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: textHeaderSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  snapshot.data![index].spareparts[0].warehouse,
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: textFooterSize,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 30),
                            QuantityInput(
                              value: quantity,
                              //step: 1,
                              onChanged: (value) => setState(
                                () => steppedIntInput = int.parse(
                                  value.replaceAll(',', ''),
                                ),
                              ),
                              buttonColor: Color.fromARGB(255, 38, 110, 177),
                              acceptsZero: true,
                            ),
                            SizedBox(width: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Wrap(
                                  children: [
                                    Container(
                                      width: w / 5.5,
                                      height: 35,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          setState(() {
                                            // _displayTextInputDialog(context);

                                            CartItemAPI().CheckoutOrder(
                                                snapshot.data[index]!.id);
                                            Fluttertoast.showToast(
                                              msg: 'Checkout Complete!',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              backgroundColor: Color.fromARGB(
                                                  255, 38, 110, 177),
                                              textColor: Colors.white,
                                              fontSize: 30,
                                            );
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Oder(),
                                              ),
                                            );
                                          });
                                        },
                                        child: Text(
                                          'Checkout',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Wrap(
                                  spacing: 8.0, // gap between adjacent chips
                                  runSpacing: 4.0,
                                  children: [
                                    Container(
                                      width: w / 5.5,
                                      height: 35,
                                      child: ElevatedButton(
                                        onPressed: () async {},
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error.toString()}');
              } else if (snapshot.data == null) {
                return Padding(
                  padding: EdgeInsets.all(12),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black26,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: <Widget>[
                        Image(
                          width: 150,
                          height: 150,
                          image: NetworkImage(
                              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/pile-of-tires-on-white-background-royalty-free-image-672151801-1561751929.jpg?crop=1.00xw:0.629xh;0,0.318xh&resize=480:*"),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Part Name",
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: textHeaderSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Part Name",
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: textFooterSize,
                              ),
                            ),
                            Column(
                              children: const [
                                Row(
                                  children: [
                                    Text(
                                      "Posted In:",
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "January 05 2024",
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Brand",
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: textHeaderSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Skygo Warehouse",
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: textFooterSize,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 30),
                        QuantityInput(
                          value: quantity,
                          //step: 1,
                          onChanged: (value) => setState(
                            () => steppedIntInput = int.parse(
                              value.replaceAll(',', ''),
                            ),
                          ),
                          buttonColor: Color.fromARGB(255, 38, 110, 177),
                          acceptsZero: true,
                        ),
                        SizedBox(width: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Wrap(
                              children: [
                                Container(
                                  width: w / 5.5,
                                  height: 35,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      setState(() {
                                        CartItemAPI().CheckoutOrder("1");
                                        Fluttertoast.showToast(
                                          msg: 'Checkout Complete!',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          backgroundColor:
                                              Color.fromARGB(255, 38, 110, 177),
                                          textColor: Colors.white,
                                          fontSize: 30,
                                        );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Oder(),
                                          ),
                                        );
                                      });
                                    },
                                    child: Text(
                                      'Checkout',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Wrap(
                              spacing: 8.0, // gap between adjacent chips
                              runSpacing: 4.0,
                              children: [
                                Container(
                                  width: w / 5.5,
                                  height: 35,
                                  child: ElevatedButton(
                                    onPressed: () async {},
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
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
            title: Text('Select Address'),
            actions: [
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
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
                      SizedBox(width: 5),
                      Text("New Address"),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Default Address"),
                      SizedBox(width: 10),
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
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        dealerAPI().updateDealer(_address.text);
                        Navigator.pop(context);
                      });
                    },
                    child: const Text('Update Address'),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
