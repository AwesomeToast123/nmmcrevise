import 'package:http/http.dart' as http;
import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.id,
    required this.created,
    required this.spareparts,
  });

  String id;
  String created;
  List<Sparepart> spareparts;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        created: json["created"],
        spareparts: List<Sparepart>.from(
            json["spareparts"].map((x) => Sparepart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created": created,
        "spareparts": List<dynamic>.from(spareparts.map((x) => x.toJson())),
      };
}

class Sparepart {
  Sparepart({
    required this.id,
    required this.name,
    required this.warehouse,
    required this.quantity,
  });

  String id;
  String name;
  String warehouse;
  int quantity;

  factory Sparepart.fromJson(Map<String, dynamic> json) => Sparepart(
        id: json["id"],
        name: json["name"],
        warehouse: json["warehouse"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "warehouse": warehouse,
        "quantity": quantity,
      };
}
