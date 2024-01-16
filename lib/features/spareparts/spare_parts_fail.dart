// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SparepartFailed extends StatefulWidget {
  const SparepartFailed({Key? key}) : super(key: key);

  @override
  _sparePartsFailedState createState() => _sparePartsFailedState();
}

class _sparePartsFailedState extends State<SparepartFailed> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            child: Row(
              children: [
                //Searchbar widget
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "Search for a specific part",
                          suffixIcon: Icon(Icons.search),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(
                                  color: Colors.black12,
                                  fontSize: 27,
                                ),
                              ),
                              Text(
                                "Welcome to nmmc",
                                style: TextStyle(
                                  color: Colors.black12,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      //Box for putting inside the cards
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 1000,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 38, 110, 177),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  //Spare Parts Available Widget
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Spare Parts Available:",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "Spare Parts Available",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
