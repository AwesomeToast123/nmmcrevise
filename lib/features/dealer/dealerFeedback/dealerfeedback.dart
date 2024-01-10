import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' as rootBundle;

class feedBackModel {
  String id;
  String message;
  String created;
  String status;

  feedBackModel({
    required this.id,
    required this.created,
    required this.status,
    required this.message,
  });

  factory feedBackModel.fromJson(Map<String, dynamic> json) => feedBackModel(
        id: json['id'],
        created: json['created'],
        status: json['status'],
        message: json["message"],
      );
}

Future<List<feedBackModel>> fetchFeedback() async {
  final response = await http.get(Uri.parse(
      'https://249703c8-739e-4228-83b6-1667b10971f9.mock.pstmn.io/dealers/9900/feedbacks'));

  if (response.statusCode == 200) {
    //return spareParts.fromJson(jsonDecode(response.body));
    var jsonResponse = json.decode(response.body);
    List<feedBackModel> feedback = [];

    for (var u in jsonResponse) {
      feedBackModel back = feedBackModel(
        id: u['id'].toString(),
        created: u['created'].toString(),
        status: u['status'].toString(),
        message: u['message'].toString(),
      );
      feedback.add(back);
    }
    return feedback;
  } else {
    throw Exception('failed to load feedback');
  }
}

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  late Future<List<feedBackModel>> Fb;

  void initState() {
    super.initState();
    Fb = fetchFeedback();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 38, 110, 177),
          title: Text("FeedBack"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Center(
          child: FutureBuilder<List<feedBackModel>>(
            future: Fb,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].message),
                        subtitle: Text(snapshot.data![index].created),
                        leading: Text(snapshot.data![index].status),
                        trailing: Text(snapshot.data![index].id),
                      );
                    });
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
