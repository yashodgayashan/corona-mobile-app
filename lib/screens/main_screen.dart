import 'package:flutter/material.dart';
import 'package:corona_app/utills/country.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Country> countries = <Country>[
    Country("AF", "Afghanistan"),
    Country("AL", "Albania"),
    Country("DZ", "Algeria"),
    Country("AO", "Angola"),
    Country("AR", "Argentina"),
    Country("AM", "Armenia"),
    Country("AU", "Australia"),
    Country("AT", "Austria")
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

  onChangedDropDownItem(Country selectedCountry){
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
                DropdownButton(
                  value: _selectedCountry,
                  items: _dropdownMenuItems,
                  onChanged: onChangedDropDownItem,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
