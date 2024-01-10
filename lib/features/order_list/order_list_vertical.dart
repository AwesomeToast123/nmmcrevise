// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:nmmcrevise/APICalls/ordersAPI.dart';
import 'package:nmmcrevise/Features/Home_Screen/home.dart';

class OderVertical extends StatefulWidget {
  const OderVertical({Key? key}) : super(key: key);

  @override
  Oder_State createState() => Oder_State();
}

class Oder_State extends State<OderVertical> {
  late Future<List<dynamic>> spur;
  String valReason = "Reasons";

  bool _isVisible = true;
  double widthSize = 130;

  double heightSize = 35;
  double textButtonSize = 15;
  double textHeaderSize = 15;
  double textFooterSize = 15;

  @override
  void initState() {
    super.initState();
    spur = OrderCallsAPI().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: FutureBuilder<List<dynamic>>(
            future: spur,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemExtent: 100,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    if (snapshot.data![index].status == "CANCELLED") {
                      this._isVisible = false;
                    } else if (snapshot.data![index].status == "RECEIVED") {
                      this._isVisible = false;
                    } else if (snapshot.data![index].status == "ON_THE_WAY") {
                      this._isVisible = false;
                    } else {
                      this._isVisible = true;
                    }
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black26,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Part Name",
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: textHeaderSize,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      snapshot.data![index].spareparts[0].name,
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: textFooterSize,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Order Number",
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: textHeaderSize,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      snapshot.data![index].id,
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: textFooterSize,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Status",
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: textHeaderSize,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        snapshot.data![index].status,
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: textFooterSize,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Date Ordered",
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: textHeaderSize,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      snapshot.data![index].created,
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: textFooterSize,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(width: 2),
                                Container(
                                  child: Visibility(
                                    visible: _isVisible,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.0, right: 0.0),
                                      child: Container(
                                        height: heightSize,
                                        width: widthSize,
                                        child: ElevatedButton(
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                              fontSize: textButtonSize,
                                            ),
                                          ),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title:
                                                        Text('Order Cancelled'),
                                                    content: Text(
                                                        "Order Sent back to Cart"),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            OrderCallsAPI()
                                                                .CancelOrder(
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .id);
                                                          });
                                                          Navigator.pop(
                                                              context, false);

                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      HomePage(),
                                                            ),
                                                          );
                                                        },
                                                        child: const Text('OK'),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //SizedBox(width: 30),
                          ],
                        ),
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
    );
  }
}
