// To parse this JSON data, do
//
//     final khasraNumRes = khasraNumResFromJson(jsonString);

import 'dart:convert';

List<KhasraNumRes> khasraNumResFromJson(String str) => List<KhasraNumRes>.from(
    json.decode(str).map((x) => KhasraNumRes.fromJson(x)));

String khasraNumResToJson(List<KhasraNumRes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KhasraNumRes {
  String? khataNumber;
  String? khasraNumber;
  String? uniqueCode;
  String? area;

  KhasraNumRes({
    this.khataNumber,
    this.khasraNumber,
    this.uniqueCode,
    this.area,
  });

  factory KhasraNumRes.fromJson(Map<String, dynamic> json) => KhasraNumRes(
        khataNumber: json["khata_number"] ?? "",
        khasraNumber: json["khasra_number"] ?? "",
        uniqueCode: json["unique_code"] ?? "",
        area: json["area"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "khata_number": khataNumber,
        "khasra_number": khasraNumber,
        "unique_code": uniqueCode,
        "area": area,
      };
}
