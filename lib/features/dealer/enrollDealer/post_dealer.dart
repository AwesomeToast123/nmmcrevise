// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nmmcrevise/Features/dealer/enrollDealer/post_dealer.dart';
import 'package:nmmcrevise/Features/dealer/enrollDealer/verification.dart';
import 'package:fluttertoast/fluttertoast.dart';


class DealerEnroll extends StatefulWidget {
  const DealerEnroll({Key? key}) : super(key: key);

  @override
  _DealerEnrollState createState() => _DealerEnrollState();
}

class _DealerEnrollState extends State<DealerEnroll> {
  String dropdownVal = 'Suffix';

  //names
  late final TextEditingController _firstname = TextEditingController();
  late final TextEditingController _lastname = TextEditingController();
  late final TextEditingController _middlename = TextEditingController();
  late final TextEditingController _secondname = TextEditingController();
  late final TextEditingController _suffix = TextEditingController();

  //other info
  late final TextEditingController _address = TextEditingController();
  late final TextEditingController _phoneNumber = TextEditingController();
  late final TextEditingController _email = TextEditingController();

  Future<enrolDealer>? _enrollDealer;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 38, 110, 177),
          title: Text('Create Dealer'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_enrollDealer == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      children: <Widget>[
        SizedBox(height: 30),
        Text(
          "Dealer Enrollment Form",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        SizedBox(height: 30),
        Row(
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                controller: _firstname,
                decoration: InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _secondname,
                decoration: InputDecoration(
                  hintText: 'Second Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _middlename,
                decoration: InputDecoration(
                  hintText: 'Middle Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _lastname,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: Colors.black38,
                    style: BorderStyle.solid,
                    width: 0.80),
              ),
              child: DropdownButton<String>(
                value: dropdownVal,
                icon: const Icon(Icons.arrow_downward),
                elevation: 24,
                style: const TextStyle(color: Colors.black54),
                underline: SizedBox(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownVal = newValue!;
                  });
                },
                items: <String>['Suffix', 'Mr', 'Ms', 'Dr.', 'Engr.', 'Capt.']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        SizedBox(height: 30),
        TextField(
          controller: _address,
          decoration: InputDecoration(
            hintText: 'Address',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          controller: _phoneNumber,
          decoration: InputDecoration(
            hintText: 'Phone Number',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(height: 30),
        Form(
          child: TextField(
            controller: _email,
            decoration: InputDecoration(
              hintText: 'Enter Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        SizedBox(height: 30),
        SizedBox(
          width: 100,
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color.fromARGB(255, 38, 110, 177),
              ),
              //padding: MaterialStateProperty.all(EdgeInsets.all(20)),
              textStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 30),
              ),
            ),
            onPressed: () {
              if (_phoneNumber.text.isEmpty &&
                  _email.text.isEmpty &&
                  _address.text.isEmpty &&
                  _firstname.text.isEmpty &&
                  _lastname.text.isEmpty &&
                  _secondname.text.isEmpty) {
                Fluttertoast.showToast(
                  msg: 'Please complete the fields',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Color.fromARGB(255, 38, 110, 177),
                  textColor: Colors.white,
                  fontSize: 16,
                );
              } else if (!_email.text.contains("@")) {
                Fluttertoast.showToast(
                  msg: 'Please enter a valid email',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Color.fromARGB(255, 38, 110, 177),
                  textColor: Colors.white,
                  fontSize: 16,
                );
              } else {
                setState(() {
                  _enrollDealer = enrollDealer(
                    _firstname.text,
                    _middlename.text,
                    _secondname.text,
                    _lastname.text,
                    _suffix.text,
                    _address.text,
                    _phoneNumber.text,
                    _email.text,
                  );
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Verify(),
                  ),
                );
              }
            },
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
      ],
    );
  }

  FutureBuilder<enrolDealer> buildFutureBuilder() {
    return FutureBuilder<enrolDealer>(
      future: _enrollDealer,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text("success!");
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
