// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_string_interpolations, non_constant_identifier_names, unused_element, avoid_unnecessary_containers, dead_code

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nmmcrevise/api_services/cart_api_services.dart';
import 'package:nmmcrevise/api_services/dealer_api_services.dart';
import 'package:nmmcrevise/Features/OrderList/orders.dart';


/* 
  Possible solution for Quantity:
    A) Edit quantity on Preview and remove quantity meter in cart
*/

class cart_item_Horizontal extends StatefulWidget {
  final int quantity;

  const cart_item_Horizontal({required this.quantity, Key? key})
      : super(key: key);

  @override
  _cartitemState createState() => _cartitemState(quantity: quantity);
}

class _cartitemState extends State<cart_item_Horizontal> {
  int steppedIntInput = 0;
  final int quantity;

  _cartitemState({required this.quantity, Key? key});

  late final TextEditingController _address = TextEditingController();

  late bool ischecked = true;
  double widthButton = 200;
  double heightButton = 50;
  double textHeaderSize = 30;
  double textFooterSize = 25;
  double textFooterSizeLittle = 25;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    steppedIntInput = 0;
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Colors.white,
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
                    steppedIntInput =
                        snapshot.data![index].spareparts[0].quantity;
                    return Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
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
                              width: 200,
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Quantity",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: textHeaderSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  snapshot.data![index].spareparts[0].quantity
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: textFooterSize,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Wrap(
                                  children: [
                                    Container(
                                      width: w / 6,
                                      height: h * 0.07,
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
                                              fontSize: 30),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Wrap(
                                  spacing: 8.0, // gap between adjacent chips
                                  runSpacing: 4.0,
                                  children: [
                                    Container(
                                      width: w / 6,
                                      height: h * 0.07,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          _displayTextInputDialog();
                                        },
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30),
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
                          width: 200,
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
                              "Something Something part",
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
                                      "January 5 2024",
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
                              "Skygo warehouse",
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: textFooterSize,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Quantity",
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: textHeaderSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "100",
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: textFooterSize,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Wrap(
                              children: [
                                Container(
                                  width: w / 6,
                                  height: h * 0.07,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      setState(() {
                                        // _displayTextInputDialog(context);
                                        CartItemAPI().CheckoutOrder("233");
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
                                          color: Colors.white, fontSize: 30),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Wrap(
                              spacing: 8.0, // gap between adjacent chips
                              runSpacing: 4.0,
                              children: [
                                Container(
                                  width: w / 6,
                                  height: h * 0.07,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      _displayTextInputDialog();
                                    },
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30),
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

  Future<void> _displayTextInputDialog() async {
    String? deliverAddress;
    bool isDefault = false;
    bool isCustomDefault = false;
    bool isChecked = false;

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return showDialog(
      context: context,
      builder: (context) {
        return Container(
          width: w,
          height: h,
          child: FutureBuilder<dynamic>(
              future: dealerAPI().fetchDealer(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: ((context, index) {
                      return Container(
                        child: AlertDialog(
                          title: Text('Select Address'),
                          actions: [
                            Column(
                              children: [
                                CheckboxListTile(
                                  title: const Text('Default Address'),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      deliverAddress =
                                          snapshot.data![index].address;
                                    });
                                  },
                                  secondary: const Icon(Icons.hourglass_empty),
                                ),
                                CheckboxListTile(
                                  title: TextField(
                                    onChanged: (value) {},
                                    controller: _address,
                                    decoration: InputDecoration(
                                        hintText: "Type in new Address"),
                                  ),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      deliverAddress =
                                          snapshot.data![index].address;
                                    });
                                  },
                                  secondary: const Text('Custom Address'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      CartItemAPI().CheckoutOrder(
                                        snapshot.data[index]!.id,
                                        deliverAddress.toString(),
                                      );
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: const Text('Confirm Address'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error.toString()}');
                } else if (snapshot.data == null) {
                  return (Text("Empty data"));
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        );
      },
    );
  }
}
