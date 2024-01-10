import 'dart:convert';

class spareParts {
  String name;
  String warehouse;
  String id;
  int quantity;
  String brand;
  String tag;
  String status;

  spareParts({
    required this.name,
    required this.id,
    required this.warehouse,
    required this.quantity,
    required this.brand,
    required this.status,
    required this.tag,
  });

  factory spareParts.fromJson(Map<String, dynamic> json) => spareParts(
        name: json["name"],
        warehouse: json["warehouse"],
        id: json["id"],
        quantity: json["quantity"],
        brand: json["brand"],
        status: json["status"],
        tag: json["tags"],
      );
}
