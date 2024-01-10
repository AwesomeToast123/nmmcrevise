import 'package:flutter/material.dart';


class OrderSearch extends StatefulWidget {
  const OrderSearch({Key? key}) : super(key: key);

  @override
  State<OrderSearch> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OrderSearch> {
  bool _isVisible = true;
  double widthSize = 150;

  double heightSize = 45;
  double textButtonSize = 25;
  double textHeaderSize = 25;
  double textFooterSize = 20;

  bool switchSearchName = false;
  bool switchSearchTag = false;
  bool switchSearchType = false;
  late String status = "Search your Items Here";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Padding(
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
                    SizedBox(width: 5),
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
                    SizedBox(width: 5),
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
                        "All",
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
                        });
                      },
                      child: Text(
                        "Price",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
        ),
      ),
    );
  }
}
