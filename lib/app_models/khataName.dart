// To parse this JSON data, do
//
//     final khataName = khataNameFromJson(jsonString);

import 'dart:convert';

List<KhataName> khataNameFromJson(String str) =>
    List<KhataName>.from(json.decode(str).map((x) => KhataName.fromJson(x)));

String khataNameToJson(List<KhataName> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KhataName {
  String khataNumber;
  String name;
  String father;

  KhataName({
    required this.khataNumber,
    required this.name,
    required this.father,
  });

  factory KhataName.fromJson(Map<String, dynamic> json) => KhataName(
        khataNumber: json["khata_number"],
        name: json["name"],
        father: json["father"],
      );

  Map<String, dynamic> toJson() => {
        "khata_number": khataNumber,
        "name": name,
        "father": father,
      };
}
