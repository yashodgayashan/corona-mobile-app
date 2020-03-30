import 'package:corona_app/utills/corona_info.dart';
import 'package:corona_app/utills/http_service.dart';
import 'package:flutter/material.dart';
import 'package:corona_app/utills/country.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  ];

  List<DropdownMenuItem<Country>> _dropdownMenuItems;
  Country _selectedCountry;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(countries);
    _selectedCountry = _dropdownMenuItems[0].value;
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
                    flex: 1,
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
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                      child: Text("Select"),
                      onPressed: () {
                        Future<CoronaData> post =
                            HttpService().getPost(id: _selectedCountry.code);
                        debugPrint(
                            "Pressed and value is ${_selectedCountry.country}");
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
