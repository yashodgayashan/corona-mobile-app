import 'package:flutter/foundation.dart';

class Country{

  String codeName;
  String countryName;

  Country({@required this.codeName,@required this.countryName});
  
  factory Country.fromJSON(Map<String, dynamic> json){
    return Country(codeName: json["code"] as String, countryName: json["title"] as String);
  }

  String get code => this.codeName;
  String get country => this.countryName;
}
