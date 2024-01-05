import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.id,
    required this.created,
    required this.spareparts,
    required this.address,
    required this.hash,
    required this.status,
  });

  String id;
  String created;
  List<Sparepart> spareparts;
  String address;
  String hash;
  String status;

  factory Welcome.fromJson(Map<String, dynamic> json) {
    return Welcome(
      id: json["id"],
      created: json["created"],
      spareparts: List<Sparepart>.from(
          json["spareparts"].map((x) => Sparepart.fromJson(x))),
      address: json["address"],
      hash: json["hash"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "created": created,
        "spareparts": List<dynamic>.from(spareparts.map((x) => x.toJson())),
        "address": address,
        "hash": hash,
        "status": status,
      };
}

class Sparepart {
  Sparepart({
    required this.id,
    required this.name,
    required this.sku,
    required this.warehouse,
    required this.quantity,
  });

  String id;
  String name;
  String sku;
  String warehouse;
  int quantity;

  factory Sparepart.fromJson(Map<String, dynamic> json) => Sparepart(
        id: json["id"],
        name: json["name"],
        sku: json["sku"],
        warehouse: json["warehouse"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sku": sku,
        "warehouse": warehouse,
        "quantity": quantity,
      };
}
