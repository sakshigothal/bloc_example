// To parse this JSON data, do
//
//     final covidPetientListModel = covidPetientListModelFromJson(jsonString);

import 'dart:convert';

CovidPetientListModel covidPetientListModelFromJson(String str) => CovidPetientListModel.fromJson(json.decode(str));

String covidPetientListModelToJson(CovidPetientListModel data) => json.encode(data.toJson());

class CovidPetientListModel {
  CovidPetientListModel({
    required this.id,
    required this.message,
    required this.global,
    required this.countries,
    required this.date,
    this.error
  });

  CovidPetientListModel.withError(String errorMessage) {
    error = errorMessage;
  }


  String? id;
  String? message;
  Global? global;
  List<Country>? countries;
  DateTime? date;
  String? error;

  factory CovidPetientListModel.fromJson(Map<String, dynamic> json) => CovidPetientListModel(
    id: json["ID"],
    message: json["Message"],
    global: Global.fromJson(json["Global"]),
    countries: List<Country>.from(json["Countries"].map((x) => Country.fromJson(x))),
    date: DateTime.parse(json["Date"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Message": message,
    "Global": global?.toJson(),
    "Countries": List<dynamic>.from(countries!.map((x) => x.toJson())),
    "Date": date?.toIso8601String(),
    "Error": error,
  };

}

class Country {
  Country({
    required this.id,
    required this.country,
    required this.countryCode,
    required this.slug,
    required this.newConfirmed,
    required this.totalConfirmed,
    required this.newDeaths,
    required this.totalDeaths,
    required this.newRecovered,
    required this.totalRecovered,
    required this.date,
    required this.premium,
  });

  String? id;
  String? country;
  String? countryCode;
  String? slug;
  int? newConfirmed;
  int? totalConfirmed;
  int? newDeaths;
  int? totalDeaths;
  int? newRecovered;
  int? totalRecovered;
  DateTime? date;
  Premium? premium;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["ID"],
    country: json["Country"],
    countryCode: json["CountryCode"],
    slug: json["Slug"],
    newConfirmed: json["NewConfirmed"],
    totalConfirmed: json["TotalConfirmed"],
    newDeaths: json["NewDeaths"],
    totalDeaths: json["TotalDeaths"],
    newRecovered: json["NewRecovered"],
    totalRecovered: json["TotalRecovered"],
    date: DateTime.parse(json["Date"]),
    premium: Premium.fromJson(json["Premium"]),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Country": country,
    "CountryCode": countryCode,
    "Slug": slug,
    "NewConfirmed": newConfirmed,
    "TotalConfirmed": totalConfirmed,
    "NewDeaths": newDeaths,
    "TotalDeaths": totalDeaths,
    "NewRecovered": newRecovered,
    "TotalRecovered": totalRecovered,
    "Date": date?.toIso8601String(),
    "Premium": premium?.toJson(),
  };
}

class Premium {
  Premium();

  factory Premium.fromJson(Map<String, dynamic> json) => Premium(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Global {
  Global({
    required this.newConfirmed,
    required this.totalConfirmed,
    required this.newDeaths,
    required this.totalDeaths,
    required this.newRecovered,
    required this.totalRecovered,
    required this.date,
  });

  int? newConfirmed;
  int? totalConfirmed;
  int? newDeaths;
  int? totalDeaths;
  int? newRecovered;
  int? totalRecovered;
  DateTime? date;

  factory Global.fromJson(Map<String, dynamic> json) => Global(
    newConfirmed: json["NewConfirmed"],
    totalConfirmed: json["TotalConfirmed"],
    newDeaths: json["NewDeaths"],
    totalDeaths: json["TotalDeaths"],
    newRecovered: json["NewRecovered"],
    totalRecovered: json["TotalRecovered"],
    date: DateTime.parse(json["Date"]),
  );

  Map<String, dynamic> toJson() => {
    "NewConfirmed": newConfirmed,
    "TotalConfirmed": totalConfirmed,
    "NewDeaths": newDeaths,
    "TotalDeaths": totalDeaths,
    "NewRecovered": newRecovered,
    "TotalRecovered": totalRecovered,
    "Date": date?.toIso8601String(),
  };
}
