
class Country{

  String codeName;
  String countryName;

  Country(this.codeName, this.countryName);

  String get code => this.codeName;
  String get country => this.countryName;
}