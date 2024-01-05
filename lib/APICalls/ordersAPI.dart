import 'package:flutter/cupertino.dart';

import '../Model/Order.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderCallsAPI {
  String orderMock =
      'https://fe43a3b4-cb0c-4c5d-bfac-3c72e2e680bc.mock.pstmn.io/dealers/95440331-a315-a0cf-0ce5-38c06a333ebc/order';

  String purchaseOrdersMock =
      'https://2edfa673-6f0f-49be-8c5d-8a38a4c0e851.mock.pstmn.io/dealers/d5f9774b-783a-4ece-b210-cf9a7a7c2cea/purchaseorders/';

  String purchaseOrderCancelMock =
      'https://2edfa673-6f0f-49be-8c5d-8a38a4c0e851.mock.pstmn.io/dealers/:did/purchaseorders/:pid/cancel';

  String Link =
      'http://localhost:7071/api/dealers/d5f9774b-783a-4ece-b210-cf9a7a7c2cea/purchaseorders';

  Future<List<Welcome>> fetchData() async {
    final response = await http.get(Uri.parse(Link));
    var body = response.body;
    List<Welcome> wel =
        List<Welcome>.from(json.decode(body).map((x) => Welcome.fromJson(x)));
    return wel;
  }
  /* WIP */

  /* Solution: dig to spareparts */
  Future<List<Welcome>> fetchPartsMix([String? query]) async {
    final response = await http.get(Uri.parse(Link));
    final List jsonResponse = json.decode(response.body);
    final filt =
        jsonResponse.where((element) => element['created'].contains(query));
    var body = response.body;
    List<Welcome> wel =
        List<Welcome>.from(filt.map((x) => Welcome.fromJson(x)));
    return wel;
  }

  /* WIP */

  Future<List<Sparepart>> partsData() async {
    final response = await http.get(Uri.parse(Link));
    var body = response.body;
    List<Sparepart> prtz = [];

    List<Welcome> wel = List<Welcome>.from(
        (json.decode(body) as List).map((x) => Welcome.fromJson(x)));

    List<Sparepart> well = List<Sparepart>.from(
        (json.decode(body) as List).map((x) => Sparepart.fromJson(x)));

    /*
    List<Sparepart> welc =
        Welcome.fromJson(json.decode(Link)) as List<Sparepart>; */

    return well;
  }

  Future<List<Welcome>> fetchPartsDate(DateTime date) async {
    String dat = date.toString();
    final response = await http.get(Uri.parse(Link));
    final List jsonResponse = json.decode(response.body);
    final filt =
        jsonResponse.where((element) => element['created'].contains(dat));
    var body = response.body;

    List<Welcome> wel =
        List<Welcome>.from(filt.map((x) => Welcome.fromJson(x)));
    return wel;
  }

  Future<List<Welcome>> fetchPartsMix2([String? query]) async {
    final response = await http.get(Uri.parse(Link));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<Welcome> parts = [];
      List<Sparepart> parte = [];

      final filt =
          jsonResponse.where((element) => element['name'].contains(query));

      for (var u in filt) {
        Welcome part = Welcome(
          address: u['address'].toString(),
          id: u['id'].toString(),
          status: u['status'].toString(),
          hash: u['hash'].toString(),
          created: u['created'].toString(),
          spareparts: parte,
        );

        Sparepart party = Sparepart(
          id: u['id'].toString(),
          name: u['name'].toString(),
          sku: u['sku'].toString(),
          warehouse: u['warehouse'].toString(),
          quantity: u['quantity'],
        );

        parts.add(part);
      }

      return parts;
    } else {
      throw Exception('Failed to load parts');
    }
  }

  /* WIP */
  /* 
  Future<List<Welcome>> fetchPartsDate([String? query]) async {
    final response = await http.get(Uri.parse(Link));
    final List jsonResponse = json.decode(response.body)['spareparts'];

    final filt =
        jsonResponse.where((element) => element['quantity'].contains(query));
    var body = response.body;

    List<Welcome> wel =
        List<Welcome>.from(filt.map((x) => Welcome.fromJson(x)));
    return wel;
  }
  */

  void CancelOrder(String pid) async {
    String CancelLink =
        'http://localhost:7071/api/dealers/d5f9774b-783a-4ece-b210-cf9a7a7c2cea/purchaseorders/$pid/cancel';

    final http.Response response = await http.patch(
      Uri.parse(CancelLink),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "message": "placeholder",
      }),
    );
  }

  void postorder(
    String id,
    String name,
    String warehouse,
    int quantity,
  ) async {
    final response = await http.post(
      Uri.parse(orderMock),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          "spareparts": [
            {
              "id": id,
              "name": name,
              "sku": "sku",
              "warehouse": warehouse,
              "quantity": quantity,
            }
          ]
        },
      ),
    );
  }
}
