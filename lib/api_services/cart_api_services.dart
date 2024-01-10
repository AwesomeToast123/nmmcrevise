import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nmmcrevise/Model/Cart.dart';

class CartItemAPI {
  String orders =
      'http://localhost:7071/api/dealers/d5f9774b-783a-4ece-b210-cf9a7a7c2cea/orders/';

  String ordersMock =
      'https://fe43a3b4-cb0c-4c5d-bfac-3c72e2e680bc.mock.pstmn.io/dealers/95440331-a315-a0cf-0ce5-38c06a333ebc/purchaseorders';

  String checkoutMock =
      'https://2edfa673-6f0f-49be-8c5d-8a38a4c0e851.mock.pstmn.io/dealers/d5f9774b-783a-4ece-b210-cf9a7a7c2cea/checkout';

  String checkout =
      'http://localhost:7071/api/dealers/d5f9774b-783a-4ece-b210-cf9a7a7c2cea/checkout';

  Future<List<Welcome>> fetchData() async {
    final response = await http.get(Uri.parse(orders));
    var body = response.body;

    List<Welcome> wel = List<Welcome>.from(
        (json.decode(body) as List).map((x) => Welcome.fromJson(x)));

    return wel;
  }

  Future<Welcome> fetchData2() async {
    final response = await http.get(Uri.parse(orders));
    var body = response.body;
    Welcome wel = Welcome.fromJson(jsonDecode(body));
    return wel;
  }

  Future<List<Welcome>> fetchDataSpareparts() async {
    final response = await http.get(Uri.parse(orders));
    var body = response.body;

    List<Welcome> wel = List<Welcome>.from(
        (json.decode(body) as List).map((x) => Welcome.fromJson(x)));

    return wel;
  }

  Future<List<Sparepart>> partsData() async {
    final response = await http.get(Uri.parse(orders));
    var body = response.body;
    List<Sparepart> prtz = [];

    /*
    List<Welcome> wel = List<Welcome>.from(
        (json.decode(body) as List).map((x) => Welcome.fromJson(x)));*/

    List<Sparepart> welc =
        Welcome.fromJson(json.decode(orders)) as List<Sparepart>;

    return welc;
  }

  Future<List<Sparepart>> getData() async {
    late List<Sparepart> part;

    final response = await http.get(Uri.parse(orders));
    var body = response.body;

    if (response.statusCode == 200) {
      var dat = json.decode(response.body);
      var rest = dat["spareparts"] as List;
      part = rest.map<Sparepart>((e) => Sparepart.fromJson(e)).toList();
    }
    return part;
  }

  Future<Welcome> CheckoutOrder(String id, [String? address]) async {
    final response = await http.post(
      Uri.parse(
          'http://localhost:7071/api/dealers/d5f9774b-783a-4ece-b210-cf9a7a7c2cea/checkout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(<String, dynamic>{
        "order": id,
      }),
    );

    if (response.statusCode == 201) {
      print(response.body);
      return Welcome.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create dealer');
    }
  }
}
