// To parse this JSON data, do
//
//     final district = districtFromJson(jsonString);

import 'dart:convert';

List<District> districtFromJson(String str) =>
    List<District>.from(json.decode(str).map((x) => District.fromJson(x)));

String districtToJson(List<District> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class District {
  String districtName;
  String districtCodeCensus;
  String districtNameEnglish;

  District({
    required this.districtName,
    required this.districtCodeCensus,
    required this.districtNameEnglish,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
        districtName: json["district_name"],
        districtCodeCensus: json["district_code_census"],
        districtNameEnglish: json["district_name_english"],
      );

  Map<String, dynamic> toJson() => {
        "district_name": districtName,
        "district_code_census": districtCodeCensus,
        "district_name_english": districtNameEnglish,
      };
}
