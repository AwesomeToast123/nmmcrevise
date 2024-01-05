import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<feedback> postFeedback(String title, String body) async {
  final response = await http.post(
    Uri.parse(
        'https://249703c8-739e-4228-83b6-1667b10971f9.mock.pstmn.io//orders/2009/purchaseorders/2010/feedback'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
    body: jsonEncode(<String, dynamic>{
      'title': title,
      'body': body,
    }),
  );

  if (response.statusCode == 201) {
    //print(response.body);
    return feedback.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create dealer');
  }
}

class feedback {
  String title;
  String body;
  String code;
  String message;

  feedback({
    required this.title,
    required this.body,
    required this.code,
    required this.message,
  });

  factory feedback.fromJson(Map<String, dynamic> json) {
    return feedback(
      title: json['warehouse'].toString(),
      body: json['address'].toString(),
      code: json['code'].toString(),
      message: json['message'].toString(),
    );
  }
}

class postfeedBack extends StatefulWidget {
  const postfeedBack({Key? key}) : super(key: key);

  @override
  _postfeedBackState createState() => _postfeedBackState();
}

class _postfeedBackState extends State<postfeedBack> {
  late final TextEditingController _FBcontroller = TextEditingController();
  late final TextEditingController _FBcontroller2 = TextEditingController();
  Future<feedback>? _postFB;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 38, 110, 177),
          title: Text('Post your feedback'),
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
          child: (_postFB == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: TextField(
            controller: _FBcontroller,
            decoration: const InputDecoration(
              hintText: 'Enter Title',
              contentPadding: EdgeInsets.symmetric(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          minLines: 11,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          controller: _FBcontroller2,
          decoration: const InputDecoration(
            hintText: 'Enter Body',
            contentPadding: EdgeInsets.symmetric(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _postFB = postFeedback(_FBcontroller.text, _FBcontroller2.text);
            });
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(300, 100),
            maximumSize: Size(300, 100),
          ),
          child: Text(
            'Create Feedback',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }

  FutureBuilder<feedback> buildFutureBuilder() {
    return FutureBuilder<feedback>(
      future: _postFB,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(snapshot.data!.code),
              Text(snapshot.data!.message),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
