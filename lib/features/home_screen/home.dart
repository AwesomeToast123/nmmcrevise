// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nmmcrevise/Features/Cart/cart_items.dart';
import 'package:nmmcrevise/Features/SpareParts/spareParts.dart';

import 'package:nmmcrevise/Features/dealer/enrollDealer/post_dealer.dart';
import 'package:nmmcrevise/features/order_list/orders.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _address = TextEditingController();

  void initState() {
    super.initState();
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
          child: ListView(
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
                  "AwesomeToast357@gmail.com",
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
                  "094533929401",
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
                      "Some Address",
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
                          fontSize: 15,
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
                  "Active",
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
                  "December 13 2023",
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
                      builder: (context) => const cart_item(quantity: 1),
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
                onPressed: () {},
                child: const Text('Update Data'),
              ),
            ],
          );
        });
  }
}
