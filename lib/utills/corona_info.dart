import 'package:flutter/foundation.dart';

class CoronaData {
  String title;
  int totalCases;
  int totalRecovered;
  int totalUnresolved;
  int totalDeaths;
  int totalNewCasesToday;
  int totalNewDeathsToday;
  int totalActiveCases;
  int totalSeriousCases;

  CoronaData(
      {@required this.title,
      @required this.totalCases,
      @required this.totalRecovered,
      @required this.totalUnresolved,
      @required this.totalDeaths,
      @required this.totalNewCasesToday,
      @required this.totalNewDeathsToday,
      @required this.totalActiveCases,
      @required this.totalSeriousCases});

  factory CoronaData.fromJSON(Map<String, dynamic> json) {
    return CoronaData(
        title: "country",
        totalCases: json["total_cases"] as int,
        totalRecovered: json["total_recovered"] as int,
        totalUnresolved: json["total_unresolved"] as int,
        totalDeaths: json["total_deaths"] as int,
        totalNewCasesToday: json["total_new_cases_today"] as int,
        totalNewDeathsToday: json["total_new_deaths_today"] as int,
        totalActiveCases: json["total_active_cases"] as int,
        totalSeriousCases: json["total_serious_cases"] as int);
  }
}
