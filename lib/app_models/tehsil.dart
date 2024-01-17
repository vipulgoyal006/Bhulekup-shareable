// To parse this JSON data, do
//
//     final tehsil = tehsilFromJson(jsonString);

import 'dart:convert';

List<Tehsil> tehsilFromJson(String str) =>
    List<Tehsil>.from(json.decode(str).map((x) => Tehsil.fromJson(x)));

String tehsilToJson(List<Tehsil> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tehsil {
  String tehsilName;
  String tehsilCodeCensus;
  String tehsilNameEnglish;

  Tehsil({
    required this.tehsilName,
    required this.tehsilCodeCensus,
    required this.tehsilNameEnglish,
  });

  factory Tehsil.fromJson(Map<String, dynamic> json) => Tehsil(
        tehsilName: json["tehsil_name"],
        tehsilCodeCensus: json["tehsil_code_census"],
        tehsilNameEnglish: json["tehsil_name_english"],
      );

  Map<String, dynamic> toJson() => {
        "tehsil_name": tehsilName,
        "tehsil_code_census": tehsilCodeCensus,
        "tehsil_name_english": tehsilNameEnglish,
      };
}
