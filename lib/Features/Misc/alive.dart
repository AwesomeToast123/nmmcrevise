import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AliveStat {
  String code;
  String message;

  AliveStat({
    required this.code,
    required this.message,
  });

  factory AliveStat.fromJson(Map<String, dynamic> json) => AliveStat(
        code: json['code'],
        message: json['message'],
      );
}

Future<List<AliveStat>> fetchAlive() async {
  final response = await http.get(Uri.parse(
      'https://249703c8-739e-4228-83b6-1667b10971f9.mock.pstmn.io/alive'));

  if (response.statusCode == 500) {
    //return spareParts.fromJson(jsonDecode(response.body));
    var jsonResponse = json.decode(response.body);
    List<AliveStat> feedback = [];

    for (var u in jsonResponse) {
      AliveStat back = AliveStat(
        code: u['code'].toString(),
        message: u['message'].toString(),
      );
      feedback.add(back);
    }
    return feedback;
  } else {
    throw Exception('failed to load feedback');
  }
}

class Alive extends StatefulWidget {
  const Alive({Key? key}) : super(key: key);

  @override
  _AliveState createState() => _AliveState();
}

class _AliveState extends State<Alive> {
  late Future<List<AliveStat>> alive_stat;

  void initState() {
    super.initState();
    alive_stat = fetchAlive();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Alive"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Center(
          child: FutureBuilder<List<AliveStat>>(
            future: alive_stat,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].message),
                      subtitle: Text(snapshot.data![index].code),
                    );
                  },
                );
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
    ;
  }
}
