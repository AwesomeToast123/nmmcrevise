import 'package:http/http.dart' as http;
import 'package:nmmcrevise/Model/dealer.dart';
import 'dart:convert';

class DealerAPI {
  String Link =
      'http://localhost:7071/api/dealers/d5f9774b-783a-4ece-b210-cf9a7a7c2cea';

  String LinkCheckout =
      'http://localhost:7071/api/dealers/d5f9774b-783a-4ece-b210-cf9a7a7c2cea/checkout';

  String LinkDealerMock =
      'https://fe43a3b4-cb0c-4c5d-bfac-3c72e2e680bc.mock.pstmn.io/dealers/95440331-a315-a0cf-0ce5-38c06a333ebc';

  String LinkCheckoutMock =
      'https://2edfa673-6f0f-49be-8c5d-8a38a4c0e851.mock.pstmn.io/dealers/d5f9774b-783a-4ece-b210-cf9a7a7c2cea/checkout';

  Future<Welcome> updateDealer(String address) async {
    final http.Response response = await http.patch(
      Uri.parse(Link),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "address": address,
      }),
    );

    if (response.statusCode == 200) {
      return Welcome.fromJson(jsonDecode(response.body));
      //return welcomeFromJson(response.body);
    } else {
      throw Exception('Failed To update album');
    }
  }

  Future<Welcome> fetchDealer() async {
    var response = await http.get(Uri.parse(Link));
    var bod = response.body;
    Welcome wel = Welcome.fromJson(jsonDecode(bod));
    return wel;
  }
}
