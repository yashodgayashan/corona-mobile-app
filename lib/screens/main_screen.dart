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
    Country(codeName: "EC", countryName: "Ecuador"),
    Country(codeName: "EG", countryName: "Egypt"),
    Country(codeName: "SV", countryName: "El Salvador"),
    Country(codeName: "GQ", countryName: "Equatorial Guinea"),
    Country(codeName: "ER", countryName: "Eritrea"),
    Country(codeName: "EE", countryName: "Estonia"),
    Country(codeName: "ET", countryName: "Ethiopia"),
    Country(codeName: "FK", countryName: "Falkland Islands"),
    Country(codeName: "FJ", countryName: "Fiji"),
    Country(codeName: "FI", countryName: "Finland"),
    Country(codeName: "FR", countryName: "France"),
    Country(codeName: "GF", countryName: "French Guiana"),
    Country(codeName: "TF", countryName: "FS Territories"),
    Country(codeName: "GA", countryName: "Gabon"),
    Country(codeName: "GM", countryName: "Gambia"),
    Country(codeName: "GE", countryName: "Georgia"),
    Country(codeName: "DE", countryName: "Germany"),
    Country(codeName: "GH", countryName: "Ghana"),
    Country(codeName: "GR", countryName: "Greece"),
    Country(codeName: "GL", countryName: "Greenland"),
    Country(codeName: "GT", countryName: "Guatemala"),
    Country(codeName: "GN", countryName: "Guinea"),
    Country(codeName: "GW", countryName: "Guinea-Bissau"),
    Country(codeName: "GY", countryName: "Guyana"),
    Country(codeName: "HT", countryName: "Haiti"),
    Country(codeName: "HN", countryName: "Honduras"),
    Country(codeName: "HK", countryName: "Hong Kong"),
    Country(codeName: "HU", countryName: "Hungary"),
    Country(codeName: "IS", countryName: "Iceland"),
    Country(codeName: "IN", countryName: "India"),
    Country(codeName: "ID", countryName: "Indonesia"),
    Country(codeName: "IR", countryName: "Iran"),
    Country(codeName: "IQ", countryName: "Iraq"),
    Country(codeName: "IE", countryName: "Ireland"),
    Country(codeName: "IL", countryName: "Israel"),
    Country(codeName: "IT", countryName: "Italy"),
    Country(codeName: "JM", countryName: "Jamaica"),
    Country(codeName: "JP", countryName: "Japan"),
    Country(codeName: "JO", countryName: "Jordan"),
    Country(codeName: "KZ", countryName: "Kazakhstan"),
    Country(codeName: "KE", countryName: "Kenya"),
    Country(codeName: "KP", countryName: "Korea"),
    Country(codeName: "XK", countryName: "Kosovo"),
    Country(codeName: "KW", countryName: "Kuwait"),
    Country(codeName: "KG", countryName: "Kyrgyzstan"),
    Country(codeName: "LA", countryName: "Lao"),
    Country(codeName: "LV", countryName: "Latvia"),
    Country(codeName: "LB", countryName: "Lebanon"),
    Country(codeName: "LS", countryName: "Lesotho"),
    Country(codeName: "LR", countryName: "Liberia"),
    Country(codeName: "LY", countryName: "Libya"),
    Country(codeName: "LT", countryName: "Lithuania"),
    Country(codeName: "LU", countryName: "Luxembourg"),
    Country(codeName: "MK", countryName: "Macedonia"),
    Country(codeName: "MG", countryName: "Madagascar"),
    Country(codeName: "MW", countryName: "Malawi"),
    Country(codeName: "MY", countryName: "Malaysia"),
    Country(codeName: "ML", countryName: "Mali"),
    Country(codeName: "MR", countryName: "Mauritania"),
    Country(codeName: "MX", countryName: "Mexico"),
    Country(codeName: "MD", countryName: "Moldova"),
    Country(codeName: "MN", countryName: "Mongolia"),
    Country(codeName: "ME", countryName: "Montenegro"),
    Country(codeName: "MA", countryName: "Morocco"),
    Country(codeName: "MZ", countryName: "Mozambique"),
    Country(codeName: "MM", countryName: "Myanmar"),
    Country(codeName: "NA", countryName: "Namibia"),
    Country(codeName: "NP", countryName: "Nepal"),
    Country(codeName: "NL", countryName: "Netherlands"),
    Country(codeName: "NC", countryName: "New Caledonia"),
    Country(codeName: "NZ", countryName: "New Zealand"),
    Country(codeName: "NI", countryName: "Nicaragua"),
    Country(codeName: "NE", countryName: "Niger"),
    Country(codeName: "NG", countryName: "Nigeria"),
    Country(codeName: "KP", countryName: "North Korea"),
    Country(codeName: "NO", countryName: "Norway"),
    Country(codeName: "OM", countryName: "Oman"),
    Country(codeName: "PK", countryName: "Pakistan"),
    Country(codeName: "PS", countryName: "Palestine"),
    Country(codeName: "PA", countryName: "Panama"),
    Country(codeName: "PG", countryName: "Papua New Guinea"),
    Country(codeName: "PY", countryName: "Paraguay"),
    Country(codeName: "PE", countryName: "Peru"),
    Country(codeName: "PH", countryName: "Philippines"),
    Country(codeName: "PL", countryName: "Poland"),
    Country(codeName: "PT", countryName: "Portugal"),
    Country(codeName: "PR", countryName: "Puerto Rico"),
    Country(codeName: "QA", countryName: "Qatar"),
    Country(codeName: "XK", countryName: "Republic of Kosovo"),
    Country(codeName: "RO", countryName: "Romania"),
    Country(codeName: "RU", countryName: "Russia"),
    Country(codeName: "RW", countryName: "Rwanda"),
    Country(codeName: "SA", countryName: "Saudi Arabia"),
    Country(codeName: "SN", countryName: "Senegal"),
    Country(codeName: "RS", countryName: "Serbia"),
    Country(codeName: "SL", countryName: "Sierra Leone"),
    Country(codeName: "SG", countryName: "Singapore"),
    Country(codeName: "SK", countryName: "Slovakia"),
    Country(codeName: "SI", countryName: "Slovenia"),
    Country(codeName: "SB", countryName: "Solomon Islands"),
    Country(codeName: "SO", countryName: "Somalia"),
    Country(codeName: "ZA", countryName: "South Africa"),
    Country(codeName: "KR", countryName: "South Korea"),
    Country(codeName: "SS", countryName: "South Sudan"),
    Country(codeName: "ES", countryName: "Spain"),
    Country(codeName: "LK", countryName: "Sri Lanka"),
    Country(codeName: "SD", countryName: "Sudan"),
    Country(codeName: "SR", countryName: "Suriname"),
    Country(codeName: "SJ", countryName: "Svalbard and Jan Mayen"),
    Country(codeName: "SZ", countryName: "Swaziland"),
    Country(codeName: "SE", countryName: "Sweden"),
    Country(codeName: "CH", countryName: "Switzerland"),
    Country(codeName: "SY", countryName: "Syrian Arab Republic"),
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
                  flex: 3,
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
