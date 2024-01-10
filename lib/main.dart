import 'package:flutter/material.dart';
import 'package:nmmcrevise/Features/Cart/cart.dart';
import 'package:nmmcrevise/Features/Home_Screen/home.dart';
import 'package:nmmcrevise/Features/OrderList/orders.dart';
import 'package:nmmcrevise/Features/SpareParts/spareParts.dart';
import 'package:nmmcrevise/Features/dealer/dealerFeedback/dealerfeedback.dart';
import 'package:nmmcrevise/Features/dealer/dealerFeedback/post_feedback.dart';
import 'package:nmmcrevise/Features/dealer/enrollDealer/post_dealer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/order': (context) => const Oder(),
        '/spareparts': (context) => const sparePart(),
        '/dealerfeedback': (context) => const FeedBack(),
        '/enrolldealer': (context) => const dealerEnroll(),
        '/postFeedback': (context) => const postfeedBack(),
        '/cart': (context) => const Cart(),
      },
    );
  }
}
