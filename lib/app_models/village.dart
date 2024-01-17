// To parse this JSON data, do
//
//     final village = villageFromJson(jsonString);

import 'dart:convert';

List<Village> villageFromJson(String str) =>
    List<Village>.from(json.decode(str).map((x) => Village.fromJson(x)));

String villageToJson(List<Village> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Village {
  String? vname;
  String? villageCodeCensus;
  String? vnameEng;
  String? pname;
  String? flgChakbandi;
  String? flgSurvey;
  String? parganaCodeNew;

  Village({
    this.vname,
    this.villageCodeCensus,
    this.vnameEng,
    this.pname,
    this.flgChakbandi,
    this.flgSurvey,
    this.parganaCodeNew,
  });

  factory Village.fromJson(Map<String, dynamic> json) => Village(
        vname: json["vname"],
        villageCodeCensus: json["village_code_census"],
        vnameEng: json["vname_eng"],
        pname: json["pname"],
        flgChakbandi: json["flg_chakbandi"],
        flgSurvey: json["flg_survey"],
        parganaCodeNew: json["pargana_code_new"],
      );

  Map<String, dynamic> toJson() => {
        "vname": vname,
        "village_code_census": villageCodeCensus,
        "vname_eng": vnameEng,
        "pname": pname,
        "flg_chakbandi": flgChakbandi,
        "flg_survey": flgSurvey,
        "pargana_code_new": parganaCodeNew,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
