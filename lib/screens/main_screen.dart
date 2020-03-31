import 'package:corona_app/utills/corona_info.dart';
import 'package:corona_app/utills/http_service.dart';
import 'package:flutter/material.dart';
import 'package:corona_app/utills/country.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<CoronaData> post;
  static List<Country> countries = <Country>[
    Country(codeName: "AF", countryName: "Afghanistan"),
    Country(codeName: "AL", countryName: "Albania"),
    Country(codeName: "DZ", countryName: "Algeria"),
    Country(codeName: "AO", countryName: "Angola"),
    Country(codeName: "AR", countryName: "Argentina"),
    Country(codeName: "AM", countryName: "Armenia"),
    Country(codeName: "AU", countryName: "Australia"),
    Country(codeName: "AT", countryName: "Austria"),
    Country(codeName: "AZ", countryName: "Azerbaijan"),
    Country(codeName: "BS", countryName: "Bahamas"),
    Country(codeName: "BD", countryName: "Bangladesh"),
    Country(codeName: "BY", countryName: "Belarus"),
    Country(codeName: "BE", countryName: "Belgium"),
    Country(codeName: "BZ", countryName: "Belize"),
    Country(codeName: "BJ", countryName: "Benin"),
    Country(codeName: "BT", countryName: "Bhutan"),
    Country(codeName: "BO", countryName: "Bolivia"),
    Country(codeName: "BA", countryName: "Bosnia & Herze"),
    Country(codeName: "BW", countryName: "Botswana"),
    Country(codeName: "BR", countryName: "Brazil"),
    Country(codeName: "BN", countryName: "Brunei Darussalam"),
    Country(codeName: "BG", countryName: "Bulgaria"),
    Country(codeName: "BF", countryName: "Burkina Faso"),
    Country(codeName: "BI", countryName: "Burundi"),
    Country(codeName: "KH", countryName: "Cambodia"),
    Country(codeName: "CM", countryName: "Cameroon"),
    Country(codeName: "CA", countryName: "Canada"),
    Country(codeName: "CI", countryName: "Ivory Coast"),
    Country(codeName: "CF", countryName: "Central African Rep"),
    Country(codeName: "TD", countryName: "Chad"),
    Country(codeName: "CL", countryName: "Chile"),
    Country(codeName: "CN", countryName: "China"),
    Country(codeName: "CO", countryName: "Colombia"),
    Country(codeName: "CG", countryName: "Congo"),
    Country(codeName: "CD", countryName: "DR Congo"),
    Country(codeName: "CR", countryName: "Costa Rica"),
    Country(codeName: "HR", countryName: "Croatia"),
    Country(codeName: "CU", countryName: "Cuba"),
    Country(codeName: "CY", countryName: "Cyprus"),
    Country(codeName: "CZ", countryName: "Czechia"),
    Country(codeName: "DK", countryName: "Denmark"),
    Country(codeName: "DP", countryName: "Diamond Princess"),
    Country(codeName: "DJ", countryName: "Djibouti"),
    Country(codeName: "DO", countryName: "Dominican Republic"),

  ];

  List<DropdownMenuItem<Country>> _dropdownMenuItems;
  Country _selectedCountry;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(countries);
    _selectedCountry = _dropdownMenuItems[0].value;
    post = HttpService().getPost(id: _selectedCountry.code);
  }

  List<DropdownMenuItem<Country>> buildDropDownMenuItems(List counties) {
    List<DropdownMenuItem<Country>> items = List();
    for (Country country in countries) {
      items.add(
        DropdownMenuItem(
          child: Text(country.country),
          value: country,
        ),
      );
    }
    return items;
  }

  onChangedDropDownItem(Country selectedCountry) {
    setState(() {
      _selectedCountry = selectedCountry;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Corona Brief",
          ),
        ),
      ),
      body: Form(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Select Country"),
                    )),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      value: _selectedCountry,
                      items: _dropdownMenuItems,
                      onChanged: onChangedDropDownItem,
                    ),
                  ),
                ),
              ],
            ),
            countryInfo()
          ],
        ),
      ),
    );
  }

  Widget countryInfo() {
    return FutureBuilder<CoronaData>(
      future: HttpService().getPost(id: _selectedCountry.code),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Text(snapshot.data.country.country),
                Row(
                  children: <Widget>[
                    Expanded(child: Text("Total Cases")),
                    Expanded(child: Text(snapshot.data.totalCases.toString())),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Text("Total Recovered")),
                    Expanded(
                        child: Text(snapshot.data.totalRecovered.toString())),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Text("Total Unresolved")),
                    Expanded(
                        child: Text(snapshot.data.totalUnresolved.toString())),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Text("Total Deaths")),
                    Expanded(child: Text(snapshot.data.totalDeaths.toString())),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Text("New Cases Today")),
                    Expanded(
                        child:
                            Text(snapshot.data.totalNewCasesToday.toString())),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Text("New Deaths Today")),
                    Expanded(
                        child:
                            Text(snapshot.data.totalNewDeathsToday.toString())),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Text("Total Active Cases")),
                    Expanded(
                        child: Text(snapshot.data.totalActiveCases.toString())),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Text("Total Serious Cases")),
                    Expanded(
                        child:
                            Text(snapshot.data.totalSeriousCases.toString())),
                  ],
                ),
              ],
            ),
          );
        }
        return Container(child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
