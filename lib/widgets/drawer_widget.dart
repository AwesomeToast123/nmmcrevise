
import 'package:flutter/material.dart';
import 'package:nmmcrevise/Features/Cart/cart_items.dart';
import 'package:nmmcrevise/Features/OrderList/orders.dart';
import 'package:nmmcrevise/Features/dealer/enrollDealer/post_dealer.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  late final TextEditingController _address = TextEditingController();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Image.network(
                    'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
              ),
            ),
            const ListTile(
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
            const ListTile(
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
            const ListTile(
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
              leading: const Icon(
                Icons.house,
                color: Color.fromARGB(255, 38, 110, 177),
                size: 30,
              ),
              title: Row(
                children: [
                  const Text(
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
                    child: const Text(
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
            const ListTile(
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
            const ListTile(
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
            const Divider(
              height: 1,
              thickness: 1,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
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
              leading: const Icon(
                Icons.bookmark,
                color: Color.fromARGB(255, 38, 110, 177),
                size: 30,
              ),
              title: const Text(
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
              leading: const Icon(
                Icons.shopping_cart,
                color: Color.fromARGB(255, 38, 110, 177),
                size: 30,
              ),
              title: const Text(
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
              leading: const Icon(
                Icons.card_giftcard,
                color: Color.fromARGB(255, 38, 110, 177),
                size: 30,
              ),
              title: const Text(
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
            const VerticalDivider(
              width: 1,
              thickness: 1,
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
