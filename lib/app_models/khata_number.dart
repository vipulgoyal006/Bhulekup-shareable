// To parse this JSON data, do
//
//     final khataNumber = khataNumberFromJson(jsonString);

import 'dart:convert';

List<KhataNumber> khataNumberFromJson(String str) => List<KhataNumber>.from(
    json.decode(str).map((x) => KhataNumber.fromJson(x)));

String khataNumberToJson(List<KhataNumber> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KhataNumber {
  String khataNumber;
  String khasraNumber;
  String uniqueCode;
  String area;

  KhataNumber({
    required this.khataNumber,
    required this.khasraNumber,
    required this.uniqueCode,
    required this.area,
  });

  factory KhataNumber.fromJson(Map<String, dynamic> json) => KhataNumber(
        khataNumber: json["khata_number"],
        khasraNumber: json["khasra_number"],
        uniqueCode: json["unique_code"],
        area: json["area"],
      );

  Map<String, dynamic> toJson() => {
        "khata_number": khataNumber,
        "khasra_number": khasraNumber,
        "unique_code": uniqueCode,
        "area": area,
      };
}
