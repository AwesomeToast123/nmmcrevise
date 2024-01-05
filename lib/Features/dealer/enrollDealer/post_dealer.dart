// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nmmcrevise/Features/dealer/enrollDealer/verification.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<enrolDealer> enrollDealer(
  String firstname,
  String middlename,
  String secondname,
  String lastname,
  String suffix,
  String address,
  String phoneNumber,
  String email,
) async {
  final response = await http.post(
    Uri.parse('http://localhost:7071/api/dealers/enroll'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
    body: jsonEncode(<String, dynamic>{
      'dealer': {
        'name': {
          'firstname': firstname,
          'middlename': middlename,
          'lastname': lastname,
          'secondname': secondname,
          'suffix': suffix,
        },
      },
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
    }),
  );

  if (response.statusCode == 201) {
    print(response.body);
    return enrolDealer.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create dealer');
  }
}

class enrolDealer {
  final String phoneNumber;
  final String email;
  final String address;
  final String secondName;
  final String firstName;
  final String middleName;
  final String lastName;
  final String suffix;
  final String id;

  enrolDealer({
    required this.id,
    required this.secondName,
    required this.phoneNumber,
    required this.address,
    required this.email,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.suffix,
  });

  factory enrolDealer.fromJson(Map<String, dynamic> json) {
    return enrolDealer(
      secondName: json['name'].toString(),
      firstName: json['dealer']['name']['firstname'].toString(),
      lastName: json['dealer']['name']['lastname'].toString(),
      middleName: json['dealer']['name']['middlename'].toString(),
      suffix: json['dealer']['name']['suffix'].toString(),
      phoneNumber: json['phoneNumber'].toString(),
      address: json['address'].toString(),
      email: json['email'].toString(),
      id: json['id'].toString(),
    );
  }
}

class dealerEnroll extends StatefulWidget {
  const dealerEnroll({Key? key}) : super(key: key);

  @override
  _dealerEnrollState createState() => _dealerEnrollState();
}

class _dealerEnrollState extends State<dealerEnroll> {
  String dropdownVal = 'Suffix';
  List<String> _dropdownValues = [
    "Suffix",
    "Mr",
    "Mrs",
    "Dr.",
    "Engr",
    "Cpt",
  ];

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
