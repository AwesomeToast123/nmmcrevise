import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nmmcrevise/Features/dealer/dealerFeedback/post_feedback.dart';



class PostFeedBack extends StatefulWidget {
  const PostFeedBack({Key? key}) : super(key: key);

  @override
  _PostFeedBackState createState() => _PostFeedBackState();
}

class _PostFeedBackState extends State<PostFeedBack> {
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
