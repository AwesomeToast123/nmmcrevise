import 'package:http/http.dart' as http;
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.status,
    required this.created,
    required this.updated,
    required this.id,
    required this.hash,
  });

  Name name;
  String address;
  String phoneNumber;
  String email;
  String status;
  String created;
  String updated;
  String id;
  String hash;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        name: Name.fromJson(json["name"]),
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        status: json["status"],
        created: json["created"],
        updated: json["updated"],
        id: json["id"],
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "address": address,
        "phoneNumber": phoneNumber,
        "email": email,
        "status": status,
        "created": created,
        "updated": updated,
        "id": id,
        "hash": hash,
      };
}

class Name {
  Name({
    required this.firstname,
    required this.middlename,
    required this.lastname,
    required this.secondname,
    required this.suffix,
  });

  String firstname;
  String middlename;
  String lastname;
  String secondname;
  String suffix;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        firstname: json["firstname"],
        middlename: json["middlename"],
        lastname: json["lastname"],
        secondname: json["secondname"],
        suffix: json["suffix"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "middlename": middlename,
        "lastname": lastname,
        "secondname": secondname,
        "suffix": suffix,
      };
}
