import 'package:nmmcrevise/Model/sparePartsOrdered.dart';
import 'package:nmmcrevise/Model/sparePartsProductGet.dart';

import '../Model/spareParts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var link = 'http://localhost:7071/api/spareparts/';

var linkMock =
    'https://fe43a3b4-cb0c-4c5d-bfac-3c72e2e680bc.mock.pstmn.io/spareparts';

var linkOrdDesc = 'http://localhost:7071/api/spareparts?volume=desc';

var linkOrdAsc = 'http://localhost:7071/api/spareparts?volume=asc';

var linkSearch = 'http://localhost:7071/api/spareparts?name=en';

class sparePartsAPI {
  Future<List<spareParts>> fetchParts([String? query]) async {
    final response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<spareParts> parts = [];

      for (var u in jsonResponse) {
        spareParts part = spareParts(
          name: u['name'].toString(),
          id: u['id'].toString(),
          warehouse: u['warehouse'].toString(),
          quantity: u['quantity'],
          brand: u['brand'].toString(),
          status: u['status'].toString(),
          tag: u['tags'].toString(),
        );
        parts.add(part);
      }
      return parts;
    } else {
      throw Exception('Failed to load parts');
    }
  }

  Future<WelcomeOrdered2> fetchSpecificParts2(String query) async {
    var response = await http
        .get(Uri.parse('http://localhost:7071/api/spareparts/$query'));
    var bod = "[" + response.body + "]";
    WelcomeOrdered2 wel = WelcomeOrdered2.fromJson(jsonDecode(bod));
    return wel;
  }

  Future<List<spareParts>> fetchSpecificParts(String query) async {
    final response = await http
        .get(Uri.parse('http://localhost:7071/api/spareparts/$query'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<spareParts> parts = [];

      for (var u in jsonResponse) {
        spareParts part = spareParts(
          name: u['name'].toString(),
          id: u['id'].toString(),
          warehouse: u['warehouse'].toString(),
          quantity: u['quantity'],
          brand: u['brand'].toString(),
          status: u['status'].toString(),
          tag: u['tags'].toString(),
        );
        parts.add(part);
      }
      return parts;
    } else {
      throw Exception('Failed to load parts');
    }
  }

  Future<List<spareParts>> fetchPartsName([String? query]) async {
    final response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<spareParts> parts = [];

      final filt =
          jsonResponse.where((element) => element['name'].contains(query));

      for (var u in filt) {
        spareParts part = spareParts(
          name: u['name'].toString(),
          id: u['id'].toString(),
          warehouse: u['warehouse'].toString(),
          quantity: u['quantity'],
          brand: u['brand'].toString(),
          status: u['status'].toString(),
          tag: u['tags'].toString(),
        );
        parts.add(part);
      }
      return parts;
    } else {
      throw Exception('Failed to load parts');
    }
  }

  Future<List<spareParts>> fetchPartsBrand([String? query]) async {
    final response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<spareParts> parts = [];

      final filt =
          jsonResponse.where((element) => element['brand'].contains(query));

      for (var u in filt) {
        spareParts part = spareParts(
          name: u['name'].toString(),
          id: u['id'].toString(),
          warehouse: u['warehouse'].toString(),
          quantity: u['quantity'],
          brand: u['brand'].toString(),
          status: u['status'].toString(),
          tag: u['tag'].toString(),
        );
        parts.add(part);
      }
      return parts;
    } else {
      throw Exception('Failed to load parts');
    }
  }

  Future<List<spareParts>> fetchPartsOutofStock() async {
    final response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<spareParts> parts = [];

      final filt = jsonResponse.where((element) => element['quantity'] <= 0);

      for (var u in filt) {
        spareParts part = spareParts(
          name: u['name'].toString(),
          id: u['id'].toString(),
          warehouse: u['warehouse'].toString(),
          quantity: u['quantity'],
          brand: u['brand'].toString(),
          status: u['status'].toString(),
          tag: u['tags'].toString(),
        );
        parts.add(part);
      }
      return parts;
    } else {
      throw Exception('Failed to load parts');
    }
  }

  Future<List<WelcomeOrdered>> fetchPartsByFrequencyDesc() async {
    final response = await http.get(Uri.parse(linkOrdAsc));
    var body = response.body;
    List<WelcomeOrdered> wel = List<WelcomeOrdered>.from(
        json.decode(body).map((x) => WelcomeOrdered.fromJson(x)));
    return wel;
  }

  Future<List<WelcomeOrdered>> fetchPartsByFrequencyAsc() async {
    final response = await http.get(Uri.parse(linkOrdDesc));
    var body = response.body;
    List<WelcomeOrdered> wel = List<WelcomeOrdered>.from(
        json.decode(body).map((x) => WelcomeOrdered.fromJson(x)));
    return wel;
  }

  Future<List<spareParts>> fetchPartsInStock() async {
    final response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<spareParts> parts = [];

      final filt = jsonResponse.where((element) => element['quantity'] > 0);

      for (var u in filt) {
        spareParts part = spareParts(
          name: u['name'].toString(),
          id: u['id'].toString(),
          warehouse: u['warehouse'].toString(),
          quantity: u['quantity'],
          brand: u['brand'].toString(),
          status: u['status'].toString(),
          tag: u['tags'].toString(),
        );
        parts.add(part);
      }
      return parts;
    } else {
      throw Exception('Failed to load parts');
    }
  }

  //Alternate API Call
  Future<List<spareParts>> fetchPartsByQuantityAlt(int min, int max) async {
    final response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<spareParts> parts = [];

      final filt = jsonResponse.where((element) =>
          element['quantity'] >= min && element['quantity'] <= max);

      for (var u in filt) {
        spareParts part = spareParts(
          name: u['name'].toString(),
          id: u['id'].toString(),
          warehouse: u['warehouse'].toString(),
          quantity: u['quantity'],
          brand: u['brand'].toString(),
          status: u['status'].toString(),
          tag: u['tags'].toString(),
        );
        parts.add(part);
      }
      return parts;
    } else {
      throw Exception('Failed to load parts');
    }
  }

  Future<List<spareParts>> fetchPartsTag([String? query]) async {
    final response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<spareParts> parts = [];

      final filt =
          jsonResponse.where((element) => element['tags'].contains(query));

      for (var u in filt) {
        spareParts part = spareParts(
          name: u['name'].toString(),
          id: u['id'].toString(),
          warehouse: u['warehouse'].toString(),
          quantity: u['quantity'],
          brand: u['brand'].toString(),
          status: u['status'].toString(),
          tag: u['tags'].toString(),
        );
        parts.add(part);
      }
      return parts;
    } else {
      throw Exception('Failed to load parts');
    }
  }

  Future<List<spareParts>> fetchPartsMix([String? query]) async {
    final response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<spareParts> parts = [];

      final filt = jsonResponse.where((element) =>
          element['tags'].contains(query) || element['name'].contains(query));

      for (var u in filt) {
        spareParts part = spareParts(
          name: u['name'].toString(),
          id: u['id'].toString(),
          warehouse: u['warehouse'].toString(),
          quantity: u['quantity'],
          brand: u['brand'].toString(),
          status: u['status'].toString(),
          tag: u['tags'].toString(),
        );
        parts.add(part);
      }
      return parts;
    } else {
      throw Exception('Failed to load parts');
    }
  }

  Future<List<spareParts>> fetchPartsByBrand([String? query]) async {
    final response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<spareParts> parts = [];
      List<String> name = [];

      final filt =
          jsonResponse.where((element) => element['brand'].contains(query));

      for (var u in filt) {
        spareParts part = spareParts(
          name: u['name'].toString(),
          id: u['id'].toString(),
          warehouse: u['warehouse'].toString(),
          quantity: u['quantity'],
          brand: u['brand'].toString(),
          status: u['status'].toString(),
          tag: u['tags'].toString(),
        );

        parts.add(part);
      }
      return parts;
    } else {
      throw Exception('Failed to load parts');
    }
  }

  Future<List<spareParts>> fetchPartsByQuantity(int min, int max) async {
    final response = await http.get(Uri.parse(
        'https://fe43a3b4-cb0c-4c5d-bfac-3c72e2e680bc.mock.pstmn.io/spareparts?start=$min&end=$max&order=asc'));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<spareParts> parts = [];

      for (var u in jsonResponse) {
        spareParts part = spareParts(
          name: u['name'].toString(),
          id: u['id'].toString(),
          warehouse: u['warehouse'].toString(),
          quantity: u['quantity'],
          brand: u['brand'].toString(),
          status: u['status'].toString(),
          tag: u['tag'].toString(),
        );
        parts.add(part);
      }
      return parts;
    } else {
      throw Exception('No Spare Parts to match that quantity');
    }
  }

  Future<List<spareParts>> fetchPartsQuantityAlt(int min, int max) async {
    final response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<spareParts> parts = [];

      final filt = jsonResponse.where(
          (element) => element['quantity'] > min && element['quantity'] < max);

      for (var u in filt) {
        spareParts part = spareParts(
          name: u['name'].toString(),
          id: u['id'].toString(),
          warehouse: u['warehouse'].toString(),
          quantity: u['quantity'],
          brand: u['brand'].toString(),
          status: u['status'].toString(),
          tag: u['tags'].toString(),
        );
        parts.add(part);
      }
      return parts;
    } else {
      throw Exception('Failed to load parts');
    }
  }

  Future<List<spareParts>> fetchPartsByUnAvailability() async {
    final response = await http
        .get(Uri.parse('http://localhost:7071/api/spareparts?outOfStock=true'));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<spareParts> parts = [];

      for (var u in jsonResponse) {
        spareParts part = spareParts(
          name: u['name'].toString(),
          id: u['id'].toString(),
          warehouse: u['warehouse'].toString(),
          quantity: u['quantity'],
          brand: u['brand'].toString(),
          status: u['status'].toString(),
          tag: u['tag'].toString(),
        );
        parts.add(part);
      }
      return parts;
    } else {
      throw Exception('Failed to load parts');
    }
  }

  Future<List<spareParts>> fetchPartsByAvailability() async {
    final response = await http.get(
        Uri.parse('http://localhost:7071/api/spareparts?outOfStock=false'));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<spareParts> parts = [];

      for (var u in jsonResponse) {
        spareParts part = spareParts(
          name: u['name'].toString(),
          id: u['id'].toString(),
          warehouse: u['warehouse'].toString(),
          quantity: u['quantity'],
          brand: u['brand'].toString(),
          status: u['status'].toString(),
          tag: u['tag'].toString(),
        );
        parts.add(part);
      }
      return parts;
    } else {
      throw Exception('Failed to load parts');
    }
  }
}
