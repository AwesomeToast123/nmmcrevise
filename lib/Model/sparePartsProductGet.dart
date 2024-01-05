import 'dart:convert';

WelcomeOrdered2 welcomeFromJson(String str) =>
    WelcomeOrdered2.fromJson(json.decode(str));

String welcomeToJson(WelcomeOrdered2 data) => json.encode(data.toJson());

class WelcomeOrdered2 {
  WelcomeOrdered2({
    required this.id,
    required this.name,
    required this.brand,
    required this.warehouse,
    required this.quantity,
    required this.status,
    required this.tags,
  });

  String id;
  String name;
  String brand;
  String warehouse;
  int quantity;
  String status;
  String tags;

  factory WelcomeOrdered2.fromJson(Map<String, dynamic> json) =>
      WelcomeOrdered2(
        id: json["id"],
        name: json["name"],
        brand: json["brand"],
        warehouse: json["warehouse"],
        quantity: json["quantity"],
        status: json["status"],
        tags: json["tags"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand": brand,
        "warehouse": warehouse,
        "quantity": quantity,
        "status": status,
        "tags": tags,
      };
}
