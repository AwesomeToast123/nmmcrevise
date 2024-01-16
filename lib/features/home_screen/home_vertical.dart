// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nmmcrevise/Features/Cart/cart_items.dart';
import 'package:nmmcrevise/Features/Home_Screen/home.dart';
import 'package:nmmcrevise/Features/SpareParts/spareParts.dart';

import 'package:nmmcrevise/Features/dealer/enrollDealer/post_dealer.dart';
import 'package:nmmcrevise/api_services/dealer_api_services.dart';
import 'package:nmmcrevise/features/order_list/orders.dart';

class HomePageVertical extends StatefulWidget {
  const HomePageVertical({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageVertical> {
  late final TextEditingController _address = TextEditingController();
  late Future<dynamic> add;

  void initState() {
    super.initState();
    add = DealerAPI().fetchDealer();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 38, 110, 177),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: FutureBuilder<dynamic>(
            future: add,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        DrawerHeader(
                          child: Container(
                            child: Image.network(
                                'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.label,
                            color: Color.fromARGB(255, 38, 110, 177),
                            size: 30,
                          ),
                          title: Text(
                            "Jorgen Morgen",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 38, 110, 177),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 38, 110, 177),
                            size: 30,
                          ),
                          title: Text(
                            snapshot.data!.email,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 38, 110, 177),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.phone_android,
                            color: Color.fromARGB(255, 38, 110, 177),
                            size: 30,
                          ),
                          title: Text(
                            snapshot.data!.phoneNumber,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 38, 110, 177),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.house,
                            color: Color.fromARGB(255, 38, 110, 177),
                            size: 30,
                          ),
                          title: Row(
                            children: [
                              Text(
                                snapshot.data!.address,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 38, 110, 177),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _displayTextInputDialog(context);
                                },
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 38, 110, 177),
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 38, 110, 177),
                            size: 30,
                          ),
                          title: Text(
                            snapshot.data!.status,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 38, 110, 177),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.person_add_alt_rounded,
                            color: Color.fromARGB(255, 38, 110, 177),
                            size: 30,
                          ),
                          title: Text(
                            snapshot.data!.created,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 38, 110, 177),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Actions',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 38, 110, 177),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.bookmark,
                            color: Color.fromARGB(255, 38, 110, 177),
                            size: 30,
                          ),
                          title: Text(
                            'Enroll',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 38, 110, 177),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          //selected: _selectedDestination == 3,
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const dealerEnroll(),
                              ),
                            ),
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.shopping_cart,
                            color: Color.fromARGB(255, 38, 110, 177),
                            size: 30,
                          ),
                          title: Text(
                            'Cart',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 38, 110, 177),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          //selected: _selectedDestination == 3,
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const cart_item(quantity: 1),
                              ),
                            ),
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.card_giftcard,
                            color: Color.fromARGB(255, 38, 110, 177),
                            size: 30,
                          ),
                          title: Text(
                            'Orders',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 38, 110, 177),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          //selected: _selectedDestination == 3,
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Oder(),
                              ),
                            ),
                          },
                        ),
                        VerticalDivider(
                          width: 1,
                          thickness: 1,
                        ),
                      ],
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error.toString()}');
              } else if (snapshot.data == null) {
                return MaterialApp(
                  home: Scaffold(
                    backgroundColor: Color.fromARGB(255, 38, 110, 177),
                    body: Container(
                      child: Column(
                        children: [
                          DrawerHeader(
                            child: Image.network(
                              'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
                            ),
                          ),
                          SizedBox(height: 50),
                          Center(
                            child: Text(
                              "Unamed Dealer, Please Verify and enroll",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const dealerEnroll(),
                                ),
                              );
                            },
                            child: Text(
                              'Enroll',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(200, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                //return const CircularProgressIndicator();
                return Container(
                  child: Column(
                    children: [
                      Text(
                        "Unamed Dealer, Please enroll and verify your credentials",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Enroll',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: sparePart(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New Address'),
            content: TextField(
              onChanged: (value) {},
              controller: _address,
              decoration: InputDecoration(hintText: "Type in new Address"),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    add = DealerAPI().updateDealer(_address.text);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (Route<dynamic> route) => false);
                  });
                },
                child: const Text('Update Data'),
              ),
            ],
          );
        });
  }
}
