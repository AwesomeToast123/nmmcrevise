import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nmmcrevise/Features/dealer/dealerFeedback/dealerfeedback.dart';


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
