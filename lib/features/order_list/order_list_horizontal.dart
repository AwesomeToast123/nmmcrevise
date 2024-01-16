// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:nmmcrevise/Features/Home_Screen/home.dart';
import 'package:nmmcrevise/api_services/orders_api_services.dart';

class OderHorizontal extends StatefulWidget {
  const OderHorizontal({Key? key}) : super(key: key);

  @override
  Oder_State createState() => Oder_State();
}

class Oder_State extends State<OderHorizontal> {
  late Future<List<dynamic>> spur;
  String valReason = "Reasons";

  bool _isVisible = true;
  double widthSize = 150;

  double heightSize = 45;
  double textButtonSize = 25;
  double textHeaderSize = 25;
  double textFooterSize = 20;

  bool switchSearchName = false;
  bool switchSearchTag = false;
  bool switchSearchType = false;
  late String status = "Search your Orders Here";

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: status,
                    suffixIcon: Icon(Icons.search),
                    counter: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Filter the Search through:",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                          ),
                        ),
                        SizedBox(width: 10, height: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              switchSearchName = true;
                              switchSearchTag = false;
                              switchSearchType = false;
                              status = "Search parts by Name";
                            });
                          },
                          child: Text(
                            "Name",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 5),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              switchSearchName = false;
                              switchSearchTag = true;
                              switchSearchType = false;
                              status = "Search parts by Tag";
                            });
                          },
                          child: Text(
                            "Date",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 2),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              switchSearchName = false;
                              switchSearchType = true;
                              switchSearchTag = false;
                              status = "Search parts by Type";
                            });
                          },
                          child: Text(
                            "Type",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 2),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              switchSearchName = false;
                              switchSearchType = false;
                              switchSearchTag = false;
                              status = "Input Desired Search Item Here";
                            });
                          },
                          child: Text(
                            "Price",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 5),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              switchSearchName = false;
                              switchSearchType = false;
                              switchSearchTag = false;
                              status = "Input Desired Search Item Here";
                              spur = OrderCallsAPI().fetchPartsMix();
                            });
                          },
                          child: Text(
                            "All",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                  ),
                  autofocus: true,
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10),
                child: FutureBuilder<List<dynamic>>(
                  future: spur,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          ListView.builder(
                            itemCount: 1,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              String date = snapshot.data![index].created;
                              String sss = date.substring(4, 8);
                              String sss2 = date.substring(2, 3);
                              String sss3 = date.substring(0, 1);

                              int dateYear = int.parse(sss);
                              int dateMonth = int.parse(sss2);
                              int dateDay = int.parse(sss3);

                              return Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      /*
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime(
                                              dateYear, dateMonth, dateDay),

                                          //maxTime: DateTime(dateYear, dateMonth, dateDay),
                                          onChanged: (date) {
                                        spur = OrderCallsAPI()
                                            .fetchPartsDate(date);
                                      }, onConfirm: (date) {
                                        spur = OrderCallsAPI()
                                            .fetchPartsDate(date);
                                      },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.en);

                                       */
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 38, 110, 177),
                                        border: Border.all(
                                          color:
                                              Color.fromARGB(255, 38, 110, 177),
                                          width: 6,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        "Sort by Date",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      /*
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime(
                                              dateYear, dateMonth, dateDay),

                                          //maxTime: DateTime(dateYear, dateMonth, dateDay),
                                          onChanged: (date) {
                                        spur = OrderCallsAPI()
                                            .fetchPartsDate(date);
                                      }, onConfirm: (date) {
                                        spur = OrderCallsAPI()
                                            .fetchPartsDate(date);
                                      },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.en);

                                       */
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 38, 110, 177),
                                        border: Border.all(
                                          color:
                                              Color.fromARGB(255, 38, 110, 177),
                                          width: 5,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        "Sort By Name alphabets",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {

                                      /*
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime(
                                              dateYear, dateMonth, dateDay),

                                          //maxTime: DateTime(dateYear, dateMonth, dateDay),
                                          onChanged: (date) {
                                        spur = OrderCallsAPI()
                                            .fetchPartsDate(date);
                                      }, onConfirm: (date) {
                                        spur = OrderCallsAPI()
                                            .fetchPartsDate(date);
                                      },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.en);
                                          */

                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 38, 110, 177),
                                        border: Border.all(
                                          color:
                                              Color.fromARGB(255, 38, 110, 177),
                                          width: 5,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        "Sort by Status",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemExtent: 100,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (snapshot.data![index].status == "CANCELLED") {
                                this._isVisible = false;
                              } else if (snapshot.data![index].status ==
                                  "RECEIVED") {
                                this._isVisible = false;
                              } else if (snapshot.data![index].status ==
                                  "ON_THE_WAY") {
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
                                          SizedBox(width: 30),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                snapshot.data![index]
                                                    .spareparts[0].name,
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: textFooterSize,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 30),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Order Number",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 25,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                snapshot.data![index].id,
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 50),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
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
                                          SizedBox(width: 50),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                      SizedBox(width: 40),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(width: 2),
                                          Visibility(
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
                                                            title: Text(
                                                                'Order Cancelled'),
                                                            content: Text(
                                                                "Order Sent back to Cart"),
                                                            actions: [
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    OrderCallsAPI().CancelOrder(
                                                                        snapshot
                                                                            .data![index]
                                                                            .id);
                                                                  });
                                                                  Navigator.pop(
                                                                      context,
                                                                      false);

                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              HomePage(),
                                                                    ),
                                                                  );
                                                                },
                                                                child:
                                                                    const Text(
                                                                        'OK'),
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error.toString()}');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
