// To parse this JSON data, do
//
//     final fasliYear = fasliYearFromJson(jsonString);

import 'dart:convert';

List<FasliYear> fasliYearFromJson(String str) =>
    List<FasliYear>.from(json.decode(str).map((x) => FasliYear.fromJson(x)));

String fasliYearToJson(List<FasliYear> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FasliYear {
  String? fasliYear;

  FasliYear({
    this.fasliYear,
  });

  factory FasliYear.fromJson(Map<String, dynamic> json) => FasliYear(
        fasliYear: json["fasli_year"],
      );

  Map<String, dynamic> toJson() => {
        "fasli_year": fasliYear,
      };
}
