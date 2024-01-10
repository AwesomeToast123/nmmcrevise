import 'dart:convert';

List<WelcomeOrdered> welcomeFromJson(String str) => List<WelcomeOrdered>.from(
    json.decode(str).map((x) => WelcomeOrdered.fromJson(x)));

String welcomeToJson(List<WelcomeOrdered> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WelcomeOrdered {
  WelcomeOrdered({
    required this.id,
    required this.name,
    required this.orders,
    required this.totalOrders,
  });

  String id;
  String name;
  List<Order> orders;
  int totalOrders;

  factory WelcomeOrdered.fromJson(Map<String, dynamic> json) => WelcomeOrdered(
        id: json["id"],
        name: json["name"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        totalOrders: json["totalOrders"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "totalOrders": totalOrders,
      };
}

class Order {
  Order({
    required this.date,
    required this.quantity,
  });

  String date;
  int quantity;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        date: json["date"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "quantity": quantity,
      };
}
